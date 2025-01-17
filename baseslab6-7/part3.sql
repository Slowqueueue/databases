-- rules

CREATE rule insert_city_rule AS ON insert TO city
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_city_rule AS ON update TO city
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_city_rule AS ON delete TO city
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_genre_rule AS ON insert TO genre
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_genre_rule AS ON update TO genre
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_genre_rule AS ON delete TO genre
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_publ_house_rule AS ON insert TO publ_house
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_publ_house_rule AS ON update TO publ_house
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_publ_house_rule AS ON delete TO publ_house
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_author_rule AS ON insert TO author
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_author_rule AS ON update TO author
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_author_rule AS ON delete TO author
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_book_rule AS ON insert TO book
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_book_rule AS ON update TO book
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_book_rule AS ON delete TO book
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_bookstore_rule AS ON insert TO store
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_bookstore_rule AS ON update TO store
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_bookstore_rule AS ON delete TO store
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_client_rule AS ON insert TO client
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_client_rule AS ON update TO client
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_client_rule AS ON delete TO client
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_shelf_rule AS ON insert TO shelf
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_shelf_rule AS ON update TO shelf
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_shelf_rule AS ON delete TO shelf
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_orders_rule AS ON insert TO orders
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_orders_rule AS ON update TO orders
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_orders_rule AS ON delete TO orders
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_order_book_rule AS ON insert TO age_group
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_order_book_rule AS ON update TO age_group
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_order_book_rule AS ON delete TO age_group
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');

CREATE rule insert_sale_rule AS ON insert TO sale
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'insert');

CREATE rule update_sale_rule AS ON update TO sale
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'update');

CREATE rule delete_sale_rule AS ON delete TO sale
	do insert INTO logger
	VALUES((SELECT (count(*) + 1) FROM logger), (SELECT current_user), (SELECT current_timestamp), 'delete');
