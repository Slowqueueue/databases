-- index

CREATE INDEX book_id_idx         ON book       USING HASH  (id);
CREATE INDEX author_name_idx     ON author     USING HASH  (name);
CREATE INDEX book_price_idx      ON book       USING HASH  (price);
CREATE INDEX publ_house_name_idx ON publ_house USING HASH  (name);
CREATE INDEX genre_name_idx      ON genre      USING HASH  (name);
CREATE INDEX shelf_idx           ON shelf      USING HASH  (book_id);
CREATE INDEX sale_date_idx       ON sale       USING BTREE (sell_date);

create function increase_quantity(_book_id int, _store_id int, int) returns varchar(30) as $$
    begin
        update shelf set quantity = (quantity + $3) where book_id = $1 and store_id = $2;
        return concat((select quantity from shelf where book_id = $1 and store_id = $2), ' books left "',
            (select name from book where id = $1),'" in "', (select name from store where id = $2), '"');
    end;
$$ language plpgsql;

create function decrease_quantity(_book_id int, _store_id int, int) returns varchar(30) as $$
    begin
        update shelf set quantity = (quantity - $3) where book_id = $1 and store_id=$2;
        return concat((select quantity from shelf where book_id = $1 and store_id=$2), ' books left "',
            (select name from book where id = $1),'" in "', (select name from store where id = $2), '"');
    end;
$$ language plpgsql;

-- $1 - client_id, $2 - store_id, $3 - shelf_id, $4 - quantity
create function add_order(int, int, int[], int) returns varchar(30) as $$
begin
	for i in 1..array_length($3::int[], 1) loop
		insert into orders(client_id, shelf_id, store_id, quantity)
		values ($1, $2 ,$3[i], $4);
	end loop;

	return concat('added ', $1, ' ', $2, ' ', $3, ' ', $4, ' to order');
end;
$$ language plpgsql;

-- $1 - order_id, $2 - sell_date
create or replace function add_sale(int, date) returns varchar(30) as $$
    declare price_inner      int;
    declare shelf_inner      int;
    declare store_inner      int;
    declare quantity_inner   int;
    declare book_inner       int;
    declare book_price_inner int;

begin
    SELECT shelf_id from orders WHERE id = $1 into shelf_inner;
    SELECT store_id from orders WHERE id = $1 into store_inner;
    SELECT quantity from orders WHERE id = $1 into quantity_inner;

	perform decrease_quantity(shelf_inner, store_inner, quantity_inner);

    SELECT book_id FROM shelf where id = shelf_inner into book_inner;
    SELECT price FROM book where id = book_inner into price_inner;

	insert into sale(order_id, price, sell_date)
	values ($1, price_inner * quantity_inner, $2);
	return concat('SOLD: ', $1);
end;
$$ language plpgsql;

create or replace function find_most_popular_book() returns int as $$
    declare shelf_id_f int;
begin
	select shelf_id into shelf_id_f from orders
	group by shelf_id
	having count(shelf_id) = (select max(count) from (select shelf_id, count(shelf_id) as count from orders
		group by shelf_id) as t);
	return shelf_id_f;
end;
$$ language plpgsql;

create or replace function avg_income_by_season(date, date) returns int as $$
    declare date1 date;
    declare date2 date;
    declare result int;

begin
	if $1 > $2 then
		select $1 into date2;
		select $2 into date1;
	else
		select $1 into date1;
		select $2 into date2;
	end if;
	select avg(price) as average_price
		from sale
			left join orders on sale.order_id = orders.id
		where sale.sell_date between date1 and date2 into result;
	return result;
end;
$$ language plpgsql;

create or replace function avg_income_by_author(varchar(30)) returns int as $$
    declare result int;
begin
	select avg(orders.quantity * book.price) as avg_price
		from orders
			left join shelf on shelf.id = orders.shelf_id
			left join book on book.id=shelf.book_id
			left join author on author.id = book.author_id
		where upper(author.name) = upper($1) into result;
	return result;
end;
$$ language plpgsql;

create or replace function avg_income_by_genre(varchar(30)) returns int as $$
    declare result int;
begin
	select avg(orders.quantity * book.price) as avg_price
		from orders
			left join shelf on shelf.id = orders.shelf_id
			left join book on book.id = shelf.book_id
			left join genre on genre.id = book.genre_id
		where upper(genre.name)=upper($1) into result;
	return result;
end;
$$ language plpgsql;

create or replace function books_age_rating(varchar(30)) returns table(book_name varchar(100)) as $$
begin
	return query select name from book
	where id = any((select array_agg(shelf.book_id) from orders left join shelf on orders.shelf_id = shelf.id
		where orders.id = any((select array_agg(t.client_id)
			from (select client_id from sale join (select orders.id, client.age_group_id
				from orders
                    left join client on client.id = orders.client_id) as ext
                    left join age_group on age_group.id = ext.age_group_id
				    on sale.order_id = ext.id
					where age_group.name = $1) as t)::int[]))::int[]);
end;
$$ language plpgsql;
