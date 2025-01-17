DROP SCHEMA IF EXISTS v4 CASCADE;
CREATE SCHEMA v4;

CREATE TABLE v4.city (
    id   SERIAL,
    name VARCHAR NOT NULL,

    PRIMARY KEY (id)
);

CREATE TYPE v4.genre_name AS 
    ENUM ('detective', 'science fiction', 'comedy', 'melodrama', 'thriller', 'novel');

CREATE TABLE v4.genre (
    id   SERIAL,
    name VARCHAR CHECK (name IN ('detective', 'science fiction', 'comedy', 'melodrama', 'thriller', 'novel'))
         NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE v4.publ_house (
    id      SERIAL,
    name    VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    popularity INT NOT NULL,
    city_id  INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (city_id) REFERENCES v4.city(id)
);

CREATE TABLE v4.author (
    id     SERIAL,
    name   VARCHAR NOT NULL,
    city_id INT NOT NULL, 

    PRIMARY KEY (id),
    FOREIGN KEY (city_id) REFERENCES v4.city(id)
);

CREATE TABLE v4.book (
    id            SERIAL,
    name          VARCHAR,
    circulation   INT CHECK (circulation > 100) NOT NULL,
    price         INT CHECK (price > 50) NOT NULL,
    pages         INT NOT NULL,
    release_date  DATE CHECK (release_date < current_date) NOT NULL, 
    author_id     INT NOT NULL,
    genre_id      INT NOT NULL,
    publ_house_id INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (author_id)     REFERENCES v4.author(id),
    FOREIGN KEY (genre_id)      REFERENCES v4.genre(id),
    FOREIGN KEY (publ_house_id) REFERENCES v4.publ_house(id)
);

SET timezone = 'Asia/Novosibirsk';