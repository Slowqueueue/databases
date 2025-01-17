-- roles

create role l6_admin with login password 'password';
create role l6_operator with login password 'password';
create role l6_user with login password 'password';
create role l6_analyst with login password 'password';

grant select on all tables in schema public to public;

grant insert, select, update, delete on city, genre, store, client to l6_operator;

grant insert, select, update, delete on publ_house, author, book, shelf, orders, sale to l6_user;

grant select on all tables in schema public to l6_analyst;

revoke all privileges on logger from l6_analyst;

grant insert, select, update, delete on all tables in schema public to l6_admin;
