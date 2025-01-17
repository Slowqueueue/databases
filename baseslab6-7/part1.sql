DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

DROP ROLE IF EXISTS l6_admin;
DROP ROLE IF EXISTS l6_operator;
DROP ROLE IF EXISTS l6_user;
DROP ROLE IF EXISTS l6_analyst;


CREATE TABLE city (
    id   SERIAL,
    name VARCHAR NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE genre (
    id   SERIAL,
    name VARCHAR NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE publ_house (
    id       SERIAL,
    city_id  INT NOT NULL,
    name     VARCHAR NOT NULL,
    address  VARCHAR NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE author (
    id      SERIAL,
    city_id INT, 
    name    VARCHAR,
    circulation INT,

    PRIMARY KEY (id),
    FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE book (
    id            SERIAL,
    author_id     INT NOT NULL,
    genre_id      INT NOT NULL,
    publ_house_id INT NOT NULL,
    name          VARCHAR,
    circulation   INT,
    price         INT CHECK (price > 100) NOT NULL,
    pages         INT CHECK (pages > 10) NOT NULL,
    release_date  DATE CHECK (release_date < current_date) NOT NULL, 

    PRIMARY KEY (id),
    FOREIGN KEY (author_id)     REFERENCES author(id),
    FOREIGN KEY (genre_id)      REFERENCES genre(id),
    FOREIGN KEY (publ_house_id) REFERENCES publ_house(id)
);

CREATE TABLE age_group (
    id   SERIAL,
    name VARCHAR CHECK (name IN ('young', 'adult', 'older')) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE client (
    id           SERIAL,
    age_group_id INT NOT NULL,
    name         VARCHAR NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (age_group_id) REFERENCES age_group(id)
);

CREATE TABLE store (
    id      SERIAL,
    name    VARCHAR NOT NULL,
    address VARCHAR NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE shelf (
    id   SERIAL,
    book_id INT NOT NULL,
    store_id INT NOT NULL,
    quantity INT CHECK (quantity > -1) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (book_id)  REFERENCES book(id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE orders (
    id   SERIAL,
    client_id INT NOT NULL,
    shelf_id INT NOT NULL,
    store_id INT NOT NULL,
    quantity INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (shelf_id)  REFERENCES shelf(id),
    FOREIGN KEY (store_id)  REFERENCES store(id)
);

CREATE TABLE sale (
    id   SERIAL,
    order_id INT NOT NULL,
    price INT NOT NULL,
    sell_date  DATE CHECK (sell_date < current_date) NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE logger (
	id           SERIAL,
	who_chg      VARCHAR,
	when_chg     TIMESTAMP,
	db_operation VARCHAR,

    PRIMARY KEY (id)
);

SET timezone = 'Asia/Novosibirsk';