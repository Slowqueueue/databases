DROP SCHEMA IF EXISTS v4 CASCADE;
CREATE SCHEMA IF NOT EXISTS v4 AUTHORIZATION ex4to;
CREATE TYPE v4.genre_name AS ENUM ('detective', 'science fiction', 'comedy', 'melodrama', 'thriller');
CREATE TABLE v4.city (
	id   SERIAL,
	name VARCHAR NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE v4.genre (
	id   SERIAL,
	name v4.genre_name CHECK (name IN ('detective', 'science fiction', 'comedy', 'melodrama', 'thriller')) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE v4.publHouse (
	id  	SERIAL,
	name	VARCHAR NOT NULL,
	address VARCHAR NOT NULL,
	cityID  INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cityID) REFERENCES v4.city(id)
);
CREATE TABLE v4.author (
	id 	SERIAL,
	name   VARCHAR NOT NULL,
	cityID INT NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (cityID) REFERENCES v4.city(id)
);

CREATE TABLE v4.book (
	id       	SERIAL,
	name     	VARCHAR,
	circulation  INT CHECK (circulation > 100) NOT NULL,
	price    	INT CHECK (price > 50) NOT NULL,
	release_date date CHECK (release_date < current_date) NOT NULL,
	authorID 	INT NOT NULL,
	genreID  	INT NOT NULL,
	publHouseID  INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (authorID)	REFERENCES v4.author(id),
	FOREIGN KEY (genreID) 	REFERENCES v4.genre(id),
	FOREIGN KEY (publHouseID) REFERENCES v4.publHouse(id)
);
SET timezone = 'Asia/Novosibirsk';
INSERT INTO
	v4.city
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
	v4.genre
	(name)
VALUES
	('detective'),
	('science fiction'),
	('comedy'),
	('melodrama'),
	('thriller');

INSERT INTO
	v4.publHouse
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
	v4.author
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
	v4.book
	(name, circulation, price, release_date, authorID, genreID, publHouseID)
VALUES
	('1985', 65000, 250, '2001-10-28', 1, 1, 1),
	('Tarrok and his fish', 23000, 180, '2020-05-11', 3, 3, 3),
	('Kasiposha adventure', 55000, 660, '2021-01-20', 2, 2, 2),
	('Magistrate 2020', 11000, 195, '1999-05-18', 4, 4, 4),
	('In Search Of Lost Keys', 200000, 666, '1985-02-24', 5, 5, 5),
	('Moby Don key-cat', 51000, 895, '2001-11-01', 6, 1, 6),
	('War and War', 67000, 999, '2005-09-30', 7, 2, 7),
	('IKEA Tutorial', 42500, 1200, '2009-04-11' ,8, 3, 8),
	('My cat - Vengeance', 25000, 1500, '2022-03-08' ,9, 4, 9),
	('Catch-44', 69000, 1800, '2019-05-28', 10, 5, 10);
ALTER TABLE v4.book
ADD pages INT;
UPDATE v4.book
SET pages = 256 WHERE id = 1;
UPDATE v4.book
SET pages = 485 WHERE id = 2;

UPDATE v4.book
SET pages = 120 WHERE id = 3;

UPDATE v4.book
SET pages = 111 WHERE id = 4;

UPDATE v4.book
SET pages = 324 WHERE id = 5;

UPDATE v4.book
SET pages = 500 WHERE id = 6;

INSERT INTO
	v4.author
	(name, cityID)
VALUES ('Nemirov', 1);

INSERT INTO
	v4.publHouse
	(name, address, cityID)
VALUES ('Siberia', 'Lenina 1', 1);

INSERT INTO
	v4.book
	(name, circulation, pages, price, release_date, authorID, genreID, publHouseID)
VALUES ('Another book', 35000, 350, 1800,  '1999-01-15', 11, 3, 11),
   	('VKontakte Guide', 95000, 220, 660, '2002-10-11', 1, 3, 11),
   	('Bizzare Adventure', 15000, 220, 6600, '2002-10-11', 2, 2, 4),
   	('Bizzare Adventure II', 5000, 120, 660, '2005-10-11', 8, 2, 8);

CREATE TABLE v4.binding (
	id   	INT,
	material VARCHAR[],
	color	VARCHAR[][],

	PRIMARY KEY (id)
);

INSERT INTO v4.binding
VALUES
	(1, '{"wood", "metal", "paper"}', '{{"black", "white", "yellow"}, {"pink", "blue", "mangheta"}, {"brown", "green", "red"}}');

INSERT INTO v4.binding
VALUES
	(3, '{"stone", "leather"}');

INSERT INTO v4.binding
VALUES
	(4, '{}', '{{"gray", "dim"}}');

INSERT INTO v4.binding
VALUES
	(5, '{"plastic", "ice", "cotton"}', '{{"red", "mango", "teal"}, {"indigo", "raspberry", "aqua"}, {"beige", "gold", "olive"}}');


SELECT material[1] FROM v4.binding;
SELECT material[1] FROM v4.binding WHERE material[1] IS NOT NULL;

SELECT material[2] as material, color[1][1] as first_col, color[1][2] as second_col FROM v4.binding;
SELECT color[1:3] FROM v4.binding;

SELECT array_dims(material) FROM v4.binding;
SELECT array_dims(color) FROM v4.binding;

CREATE OR REPLACE VIEW v4.info AS (
SELECT
	v4.book.name AS bookName,
	v4.genre.name AS bookGenre,
	v4.book.release_date AS release_date,
	v4.book.circulation AS circulation,
	v4.book.price AS price,
	v4.book.pages AS pages,
	v4.author.name AS authorName,
	v4.city.name AS cityName,
	v4.publHouse.name AS publhouse_name
FROM
	v4.book
	LEFT JOIN v4.author ON v4.book.authorID = v4.author.id
	LEFT JOIN v4.city ON v4.author.cityID = v4.city.id
	LEFT JOIN v4.genre ON v4.book.genreID = v4.genre.id
	LEFT JOIN v4.publHouse ON v4.book.publHouseID = v4.publHouse.id
);

SELECT MAX(v4.book.pages) FROM v4.book;
SELECT MIN(v4.info.pages) FROM v4.info WHERE v4.info.bookgenre = 'comedy';
SELECT AVG(v4.info.pages) FROM v4.info WHERE v4.info.bookgenre = 'science fiction';
SELECT COUNT(v4.info.bookName) FROM v4.info WHERE v4.info.publHouse = 'Siberia';
SELECT SUM(v4.info.price) FROM v4.info WHERE v4.info.cityname = 'Moscow';
