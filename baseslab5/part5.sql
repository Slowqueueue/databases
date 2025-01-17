-- Вывести полную информацию о произведениях, в которых более 300 страниц
SELECT 
    v4.book.name AS book_name,
    v4.book.circulation AS circulation,
    v4.book.price AS book_price,
    v4.book.pages AS book_pages,
    v4.book.release_date AS book_date,
    v4.publ_house.name AS publ_name,
    v4.publ_house.address AS publ_address,
    v4.publ_house.popularity AS publ_popularity,
    v4.author.name AS author_name,
    v4.city.name AS city_name,
    v4.genre.name AS genre_name
FROM v4.book
    LEFT JOIN v4.publ_house ON v4.book.publ_house_id = v4.publ_house.id
    LEFT JOIN v4.genre ON v4.book.genre_id = v4.genre.id
    LEFT JOIN v4.author ON v4.book.author_id = v4.author.id
    LEFT JOIN v4.city ON v4.author.city_id = v4.city.id
WHERE v4.book.pages > 300;

--  Найти все дороже 1000 р. заданного автора
SELECT 
    v4.book.name AS book_name,
    v4.book.circulation AS circulation,
    v4.book.price AS book_price,
    v4.book.pages AS book_pages,
    v4.book.release_date AS book_date,
    v4.author.name AS author_name
FROM v4.book
    LEFT JOIN v4.author ON v4.book.author_id = v4.author.id
WHERE v4.author.name = 'Alekseev'
    AND v4.book.price > 1000;

-- Найти всю литературу заданного издательства, выпущенную за последние три месяца
SELECT 
    v4.book.name AS book_name,
    v4.book.circulation AS circulation,
    v4.book.price AS book_price,
    v4.book.pages AS book_pages,
    v4.book.release_date AS book_date,
    v4.publ_house.name AS publ_name
FROM v4.book
    LEFT JOIN v4.publ_house ON v4.book.publ_house_id = v4.publ_house.id
    LEFT JOIN v4.genre ON v4.book.genre_id = v4.genre.id
WHERE v4.publ_house.name = 'History Supremacy'
    AND v4.book.release_date > current_date::date - interval '3 months';

-- Найти все книги, чей тираж более 500 экземпляров для жанра «мелодрама».
SELECT 
    v4.book.name AS book_name,
    v4.book.circulation AS circulation,
    v4.book.price AS book_price,
    v4.book.pages AS book_pages,
    v4.genre.name AS genre_name
FROM v4.book
    LEFT JOIN v4.genre ON v4.book.genre_id = v4.genre.id
WHERE v4.book.circulation > 500
    AND v4.genre.name = 'novel';

-- Найти рассказы и новеллы жанров «фантастика» и «комедия» издательств «Сибирь» и «Наука».
SELECT 
    v4.book.name AS book_name,
    v4.publ_house.name AS publ_name,
    v4.publ_house.address AS publ_address
FROM v4.book
    LEFT JOIN v4.publ_house ON v4.book.publ_house_id = v4.publ_house.id
    LEFT JOIN v4.genre ON v4.book.genre_id = v4.genre.id
WHERE (v4.publ_house.name = 'Syberia'
    OR v4.publ_house.name = 'Science')
    AND (v4.genre.name = 'science fiction'
    OR v4.genre.name = 'comedy');
