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
    ('thriller'),
    ('novel');

INSERT INTO
    v4.publ_house
    (name, address, popularity ,city_id)
VALUES
    ('Syberia', 'Mira 14/2', 213, 1),
    ('Science', 'Lenina 9k2', 220, 2),
    ('Myst & Co.', 'Sadovaya 2', 620, 3),
    ('Fanta Limited Co.', 'Lynnaya 126', 110, 4),
    ('Horrorita', 'Pushkina 15', 500, 5),
    ('All Ficti', 'Glavnaya 166', 350, 6),
    ('History Supremacy', 'Pobochnaya 1', 400, 7),
    ('Thrill&Chill', 'Odina 22k3', 300, 8),
    ('BioPeople', 'Petrova 11', 400, 9),
    ('Books&Cooks', 'Dumskaya 9', 250, 10);

INSERT INTO
    v4.author
    (name, city_id)
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
    (name, circulation, pages, price, release_date, author_id, genre_id, publ_house_id)
VALUES
    ('1985', 65000, 350, 250, '2021-11-28', 1, 1, 1),
    ('Kasiposha adventure', 55000, 280, 660, '2022-01-20', 2, 2, 2),
    ('Tarrok and his fish', 23000, 350, 180, '2022-05-11', 3, 3, 3),
    ('Magistrate 2020', 11000, 410, 195, '1999-05-18', 4, 4, 4),
    ('In Search Of Lost Keys', 200000, 450, 666, '2022-02-24', 5, 5, 5),
    ('Moby Don key-cat', 51000, 350, 895, '2021-11-01', 6, 6, 6),
    ('War and War', 67000, 520, 999, '2023-09-30', 7, 1, 7),
    ('IKEA Tutorial', 42500, 220, 400, '2022-04-11', 8, 2, 8),
    ('My cat - Vengeance', 25000, 420, 500, '2022-03-08', 9, 3, 9),
    ('Catch-44', 69000, 320, 500, '2022-05-28', 10, 4, 10),

    ('Agony I', 75000, 460, 350, '2021-11-28', 1, 5, 1),
    ('Agony II', 65000, 380, 760, '2022-02-20', 2, 6, 2),
    ('Metal Science', 33000, 450, 280, '2022-06-11', 3, 1, 3),
    ('Open Education', 21000, 510, 295, '2000-05-18', 4, 2, 4),
    ('National Projects', 300000, 550, 766, '2022-03-24', 5, 3, 5),
    ('Polis 5', 61000, 450, 995, '2022-10-01', 6, 4, 6),
    ('Nanotech', 77000, 620, 1099, '2023-08-15', 7, 5, 7),
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
