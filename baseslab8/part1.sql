create function delete_author() returns trigger as $$
begin
	delete from shelf
	where book_id in (select id from book where author_id=old.id);
	delete from book
	where author_id = old.id;
	return old;
end;
$$ language 'plpgsql';

create trigger delete_author_cascade
	before delete on author
	for each row
execute procedure delete_author();

create function add_author() returns trigger as $$
begin
	if new.name is null then
		new.name = 'Author|' || round(random() * 100000 + 1)::text;

	end if;
	if new.city_id is null then
		new.city_id = 11;
	end if;
	if new.circulation is null or new.circulation <= 50 then 
		if new.city_id = 11 
		then
			new.circulation = 50;
		else
			new.circulation = 0;
		end if;
	end if;
	return new;
end;
$$ language 'plpgsql';

create trigger add_author
	before insert
	on author
	for each row
execute procedure add_author();

insert into author (name, city_id, circulation) VALUES ('Newish Jr.', null, null);
insert into author (name, city_id, circulation) VALUES ('Newish', 11, null);
insert into author (name, city_id, circulation) VALUES (null, 4, 100);

create or replace function echo(s int) returns char(30) as
$$
begin
    return s::char(30);
end;
$$
language 'plpgsql';

create or replace function echo(s char(30)) returns char(30) as $$
begin
    return s;
end; $$
language 'plpgsql';

create or replace function increase_price() returns trigger as $$
    begin
        if old.name != new.name
        then
            update book set price = (price + (price / 5)::int) where publ_house_id = new.id;
        end if;
        return new;
    end;
$$ language 'plpgsql';

create or replace trigger increase_price
	after update on publ_house
	for each row
execute procedure increase_price();
