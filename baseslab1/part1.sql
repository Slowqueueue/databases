DROP SCHEMA IF EXISTS l1_v4 CASCADE;
CREATE SCHEMA l1_v4;

CREATE TABLE l1_v4.city (
    id   SERIAL,
    name VARCHAR NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE l1_v4.genre (
    id   SERIAL,
    name VARCHAR NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE l1_v4.publHouse (
    id      SERIAL,
    name    VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    cityID  INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (cityID) REFERENCES l1_v4.city(id)
);

CREATE TABLE l1_v4.author (
    id     SERIAL,
    name   VARCHAR NOT NULL,
    cityID INT NOT NULL, 

    PRIMARY KEY (id),
    FOREIGN KEY (cityID) REFERENCES l1_v4.city(id)
);

CREATE TABLE l1_v4.book (
    id          SERIAL,
    name        VARCHAR,
    circulation INT NOT NULL,
    authorID    INT NOT NULL,
    genreID     INT NOT NULL,
    publHouseID INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (authorID)    REFERENCES l1_v4.author(id),
    FOREIGN KEY (genreID)     REFERENCES l1_v4.genre(id),
    FOREIGN KEY (publHouseID) REFERENCES l1_v4.publHouse(id)
);

SET timezone = 'Asia/Novosibirsk';






INSERT INTO
    l1_v4.city
    (name)
VALUES
    ('Moscow'),
    ('Saint-Petersburg'),
    ('Novosibirsk'),
    ('Krasnodar'),
    ('Kazan'),
    ('Ufa'),
    ('Samara'),
    ('Omsk'),
    ('Saratov'),
    ('Perm');

INSERT INTO
    l1_v4.genre
    (name)
VALUES
    ('Romance novel'),
    ('Science fiction'),
    ('Mystery'),
    ('Fantasy'),
    ('Horror'),
    ('Fiction'),
    ('Historical Fiction'),
    ('Thriller'),
    ('Biography'),
    ('Dystopia');

INSERT INTO
    l1_v4.publHouse
    (name, address, cityID)
VALUES
    ('Romanco', 'Mira 14/2', 1),
    ('Sciencia', 'Lenina 9k2', 2),
    ('Myst & Co.', 'Sadovaya 2', 3),
    ('Fanta Limited Co.', 'Lynnaya 126', 4),
    ('Horrorita', 'Pushkina 15', 5),
    ('All Ficti', 'Glavnaya 166', 6),
    ('History Supremacy', 'Pobochnaya 1', 7),
    ('Thrill&Chill', 'Odina 22k3', 8),
    ('BioPeople', 'Petrova 11', 9),
    ('Books&Cooks', 'Dumskaya 9', 10);

INSERT INTO
    l1_v4.author
    (name, cityID)
VALUES
    ('Mokan', 1),
    ('Baranova', 2),
    ('Ivanov', 3),
    ('Lebedev', 4),
    ('Smirnov', 5),
    ('Kolokolov', 6),
    ('Alekseev', 7),
    ('Pavlov', 8),
    ('Kozlov', 9),
    ('Isaev', 10);

INSERT INTO
    l1_v4.book
    (name, circulation, authorID, genreID, publHouseID)
VALUES
    ('1985', 65000, 1, 1, 1),
    ('Tarrok and his fish', 23000, 3, 3, 3),
    ('Kasiposha adventure', 55000, 2, 2, 2),
    ('Magistrate 2020', 11000, 4, 4, 4),
    ('In Search Of Lost Keys', 200000, 5, 5, 5),
    ('Moby Don key-cat', 51000, 6, 6, 6),
    ('War and War', 67000, 7, 7, 7),
    ('IKEA Tutorial', 42500, 8, 8, 8),
    ('My cat - Vengeance', 25000, 9, 9, 9),
    ('Catch-44', 69000, 10, 10, 10);

ALTER TABLE
    l1_v4.book
ADD 
bestseller boolean;

UPDATE
    l1_v4.book
SET
    bestseller = false;

UPDATE
    l1_v4.book
SET
    bestseller = true
WHERE 
    circulation > 50000;

CREATE TYPE l1_v4.publ_house_status as enum ('OPEN', 'CLOSED');

ALTER TABLE
    l1_v4.publHouse
ADD
    publStatus l1_v4.publ_house_status;

UPDATE
    l1_v4.publHouse
SET
    publStatus = 'OPEN';

UPDATE
    l1_v4.publHouse
SET
    publStatus = 'CLOSED'
WHERE
    id = 5;

CREATE OR REPLACE VIEW l1_v4.info AS (
SELECT
    l1_v4.book.name AS bookName,
    l1_v4.genre.name AS bookGenre,
    l1_v4.author.name AS authorName,
    l1_v4.city.name AS authorCity
FROM
    l1_v4.book
    LEFT JOIN l1_v4.author ON l1_v4.book.authorID = l1_v4.author.id
    LEFT JOIN l1_v4.city ON l1_v4.author.cityID = l1_v4.city.id
    LEFT JOIN l1_v4.genre ON l1_v4.book.genreID = l1_v4.genre.id
)
