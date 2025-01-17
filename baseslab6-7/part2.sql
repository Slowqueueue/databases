INSERT INTO city(name)
VALUES
	('Surgut'),
	('Kazan'),
	('Vorkuta'),
	('Chita'),
	('Novosibirsk'),
	('Minsk'),
	('Brno'),
	('Bratislava'),
	('Moscow'),
	('Prague'),
	('Samara');

INSERT INTO
    genre (name)
VALUES
    ('detective'),
    ('science fiction'),
    ('comedy'),
    ('melodrama'),
    ('thriller'),
    ('novel');

INSERT INTO
    publ_house
    (name, address ,city_id)
VALUES
    ('Syberia', 'Mira 14/2', 1),
    ('Science', 'Lenina 9k2', 2),
    ('Myst & Co.', 'Sadovaya 2', 3),
    ('Fanta Limited Co.', 'Lynnaya 126', 4),
    ('Horrorita', 'Pushkina 15', 5),
    ('All Ficti', 'Glavnaya 166', 6),
    ('History Supremacy', 'Pobochnaya 1', 7),
    ('Thrill&Chill', 'Odina 22k3', 8),
    ('BioPeople', 'Petrova 11', 9),
    ('Books&Cooks', 'Dumskaya 9', 10);

INSERT INTO
    author (name, circulation ,city_id)
VALUES
    ('Stalin', 5000,1),
    ('Chernov', 8000, 2),
    ('Ivanov', 16000, 3),
    ('Lebedev', 11000, 4),
    ('Smirnov', 1000, 5),
    ('Kolokolov', 5250, 6),
    ('Alekseev', 8900, 7),
    ('Pavlov', 6500, 8),
    ('Kozlov', 12560, 9),
    ('Isaev', 11500, 10);

INSERT INTO
    book
    (name, circulation, pages, price, release_date, author_id, genre_id, publ_house_id)
VALUES
    ('1985', 65000, 350, 250, '2021-11-28', 1, 1, 1),
    ('Kasiposha adventure', 55000, 280, 660, '2022-01-20', 2, 2, 2),
    ('Tarrok and his fish', 23000, 350, 180, '2022-05-11', 3, 3, 3),
    ('Magistrate 2020', 11000, 410, 195, '1999-05-18', 4, 4, 4),
    ('In Search Of Lost Keys', 200000, 450, 666, '2022-02-24', 5, 5, 5),
    ('Moby Don key-cat', 51000, 350, 895, '2021-11-01', 6, 6, 6),
    ('War and War', 67000, 520, 999, '2022-09-30', 7, 1, 7),
    ('IKEA Tutorial', 42500, 220, 400, '2022-04-11', 8, 2, 8),
    ('My cat - Vengeance', 25000, 420, 500, '2022-03-08', 9, 3, 9),
    ('Catch-44', 69000, 320, 500, '2022-05-28', 10, 4, 10),

    ('Agony I', 75000, 460, 350, '2021-11-28', 1, 5, 1),
    ('Agony II', 65000, 380, 760, '2022-02-20', 2, 6, 2),
    ('Metal Science', 33000, 450, 280, '2022-06-11', 3, 1, 3),
    ('Open Education', 21000, 510, 295, '2000-05-18', 4, 2, 4),
    ('National Projects', 300000, 550, 766, '2022-03-24', 5, 3, 5),
    ('Polis 5', 61000, 450, 995, '2022-10-01', 6, 4, 6),
    ('Nanotech', 77000, 620, 1099, '2022-10-23', 7, 5, 7),
    ('Newest History', 52500, 320, 400, '2022-09-11', 8, 6, 8),
    ('Russian World', 45000, 520, 600, '2022-09-08', 9, 1, 9),
    ('Bird Wings', 79000, 420, 600, '2022-10-23', 10, 2, 10),

    ('Moto', 55000, 250, 150, '2021-09-28', 1, 3, 1),
    ('Moto II', 45000, 180, 560, '2022-01-20', 2, 4, 2),
    ('Shroud The Storm', 23000, 350, 180, '2022-05-11', 3, 5, 3),
    ('Blade of Hades', 11000, 410, 195, '1999-05-18', 4, 6, 4),
    ('The Coming of Nine', 200000, 450, 666, '1985-02-24', 5, 1, 5),
    ('One Spindle', 51000, 350, 895, '2021-11-01', 6, 2, 6),
    ('City of Hades', 67000, 520, 999, '2022-09-30', 7, 3, 7),
    ('Druids Rise', 42500, 220, 300, '2022-05-11', 8, 4, 8),
    ('Harlequin Kiss', 25000, 420, 400, '2022-09-08', 9, 5, 9),
    ('Shard', 69000, 320, 400, '2022-05-28', 10, 6, 10);

INSERT INTO age_group (name)
VALUES ('young'), ('adult'), ('older');

INSERT INTO client(name, age_group_id)
VALUES 
	('Alina Volkova', 1),
	('Nikolay Belkin', 2),
	('Fedor Tilov', 3),
	('Nikita Morzov', 1),
	('Sofia Kim', 2),
	('Olya Bedareva', 3),
	('Ivan Usov', 3),
	('Maria Avdoshina', 1),
	('Diana Morskay', 2);

INSERT INTO store(name, address)
VALUES
	('Abobinsk', 'Zarya 11'),
	('Books Co.', 'Xenon 19'),
	('Cetera', 'St. Volws 66'),
	('Donkey Books', 'Leon 15'),
	('The house of books', 'Baymana, 28'),
	('Word world', 'Shiminskay, 83/1'),
	('Centre', 'Lenina, 80'),
	('Labirint', 'Leskova, 45'),
	('Rosman', 'Sverdlova, 23');

INSERT INTO shelf (book_id, store_id, quantity)
VALUES
	(1, 1, 15),
	(1, 2, 13),
	(1, 3, 12),
	(2, 1, 10),
	(2, 3, 19),
	(2, 4, 9),
	(3, 2, 10),
	(3, 3, 19),
	(4, 1, 20),
	(4, 4, 14),
	(5, 2, 10),
	(5, 3, 7),
	(6, 3, 19),
	(6, 4, 4),
	(7, 1, 18),
	(7, 3, 10),
	(8, 1, 25),
	(8, 2, 9),
	(8, 3, 11),
	(8, 4, 12),
	(9, 4, 7),
	(10, 1, 10),
	(10, 2, 6),
	(10, 4, 14),
	(11, 1, 10), 
	(11, 2, 8),
	(12, 3, 9),
	(12, 4, 9),
	(13, 2, 10),
	(13, 3, 19),
	(14, 1, 11),
	(14, 4, 18),
	(15, 1, 20),
	(16, 4, 8),
	(17, 1, 13),
	(17, 3, 7),
	(18, 2, 10),
	(19, 1, 27),
	(19, 3, 9),
	(19, 4, 5),
	(20, 1, 18),
	(21, 3, 23),
	(21, 2, 12),
	(22, 1, 15),
	(22, 4, 10),
	(23, 1, 19),
	(23, 3, 17),
	(24, 2, 14),
	(24, 3, 5),
	(25, 1, 20),
	(25, 2, 4),
	(26, 1, 10),
	(26, 3, 3),
	(27, 2, 16),
	(27, 3, 9),
	(27, 4, 12);
