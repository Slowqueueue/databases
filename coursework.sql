CREATE TABLE captains (id_cap serial NOT NULL PRIMARY KEY, last_name varchar(40) NOT NULL, first_name varchar(40) NOT NULL, surname varchar(40) NOT NULL );
CREATE TABLE results (id_res serial NOT NULL PRIMARY KEY, match int NOT NULL, goal int NOT NULL, pass int NOT NULL);
CREATE TABLE address (id_addr serial NOT NULL PRIMARY KEY, address varchar(40));
CREATE TABLE teamn (namet_id serial NOT NULL PRIMARY KEY, team_name varchar(40));
CREATE TABLE weeks (weeks_id serial NOT NULL PRIMARY KEY, week_date date);
CREATE TABLE place (id_place serial NOT NULL PRIMARY KEY, place varchar (40));
CREATE TABLE league (id_team serial NOT NULL PRIMARY KEY, team_league int NOT NULL , name_league varchar(40) NOT NULL, cap_id int NOT NULL, FOREIGN KEY (cap_id) REFERENCES captains (id_cap), name_team int NOT NULL, FOREIGN KEY (name_team) REFERENCES teamn (namet_id));
CREATE TABLE players (id_players serial NOT NULL PRIMARY KEY, part_in_match BOOLEAN NOT NULL, last_name varchar(40) NOT NULL, first_name varchar(40) NOT NULL, surname varchar(40) NOT NULL, address_id int NOT NULL, FOREIGN KEY (address_id) REFERENCES address (id_addr), position varchar(40) NOT NULL, team_command int NOT NULL, FOREIGN KEY (team_command) REFERENCES league (id_team) );
CREATE TABLE game (id_game serial NOT NULL PRIMARY KEY, rival_one int NOT NULL, FOREIGN KEY (rival_one) REFERENCES league (id_team), rival_two int NOT NULL, FOREIGN KEY (rival_two) REFERENCES league (id_team), place_id int NOT NULL, FOREIGN KEY (place_id) REFERENCES place (id_place), id_weeks int NOT NULL, FOREIGN KEY (id_weeks) REFERENCES weeks (weeks_id), res_id int NOT NULL, FOREIGN KEY (res_id) REFERENCES results (id_res), players_id int NOT NULL, FOREIGN KEY (players_id) REFERENCES players (id_players));
INSERT INTO captains (id_cap, last_name, first_name, surname) VALUES(1,'Ivanovich', 'Ivan','Ivanov'),(2,'Percevoy','Nikita','Nikolaevich'),(3,'Koronov','Karen', 'Karmenovich'),(4,'Tarapchenuk','Anatoliy','Alexandrovich');
INSERT INTO results (id_res, match, goal, pass) VALUES (1,1,4,3),(2,1,5,3),(3,1,4,1),(4,1,2,3),(5,1,4,5),(6,1,4,5),(7,1,3,4),(8,1,3,4),(9,1,4,4),(10,1,3,4),(11,1,3,7),(12,1,4,3),(13,1,5,3),(14,1,4,1),(15,1,5,3),(16,1,4,5),(17,2,2,1),(18,2,4,2),(19,2,3,4),(20,2,3,4),(21,2,8,2),(22,2,2,1),(23,2,2,4),(24,2,3,1),(25,2,3,1),(26,2,1,6),(27,2,2,2),(28,2,1,3),(29,2,3,2),(30,2,1,1),(31,2,1,5),(32,2,2,1),(33,3,2,3),(34,3,1,2),(35,3,2,4),(36,3,1,5),(37,3,4,3),(38,3,3,4),(39,3,4,4),(40,3,2,4),(41,3,2,3),(42,3,1,4),(43,3,3,4),(44,3,4,3),(45,3,5,4),(46,3,4,5),(47,3,2,1),(48,3,3,3),(49,4,1,2),(50,4,3,2),(51,4,4,3),(52,4,2,3),(53,4,1,4),(54,4,6,3),(55,4,3,3),(56,4,1,2),(57,4,3,4),(58,4,3,1),(59,4,1,3),(60,4,3,3),(61,4,4,4),(62,4,1,2),(63,4,5,2),(64,4,3,5);
INSERT INTO address (id_addr, address) VALUES(1,'Zabalueva'),(2,'Lenina'),(3,'Ostrovskogo'),(4,'Galickogo');
INSERT INTO teamn (namet_id, team_name) VALUES(1,'BarsZa'),(2,'Lupa'),(3,'Chikalov'),(4,'Hugarden');
INSERT INTO weeks (weeks_id, week_date) VALUES(1,'01-01-2023'),(2,'08-01-2023'),(3,'15-01-2023'),(4,'22-01-2023');
INSERT INTO place (id_place, place) VALUES(1,'Leningradskiy'),(2,'Arena'),(3,'Karpatskiy'),(4,'Arbatskiy');
INSERT INTO league (id_team, team_league, name_league, cap_id, name_team) VALUES (1, 1,'Leather BALLS', 1, 1 ), (2, 2,'Leather BALLS', 2, 2 ), (3, 3,'Leather BALLS', 3, 3 ), (4, 4,'Leather BALLS', 4, 4 );
INSERT INTO players (id_players, part_in_match, last_name, first_name, surname, address_id, position, team_command) VALUES(1, true, 'Popov','Kirill','Maksimovich', 1, 'Atack', 1), (2, true, 'Ovcharenko','Nikolay','Daniilovich', 2, 'Defend', 1), (3, true, 'Oktavin','Denis','Denisovich', 3, 'Mid', 1), (4, true, 'Koklush','Karman','Karmenovich', 3, 'Forward', 1), (5, true, 'Kran','Moral','Gafurovich', 4, 'Atack', 2), (6, true, 'Golubev','Maksim','Artemovich', 2, 'Defend', 2), (7, true, 'Fortunov','Talib','Anatolievich', 3, 'Mid', 2), (8, true, 'Papanov','Danil','Karimovich', 2, 'Forward', 2), (9, true, 'Lobkov','Anzor','Kalianovich', 1, 'Atack', 3), (10, true, 'Cheremisin','Georgiy','Gavrilovich', 4, 'Defend', 3), (11, true, 'Tomilin','Sergey','Fedorovich', 1, 'Mid', 3), (12, true, 'Trombon','Grigoriy','Fedorovich', 4, 'Forward', 3), (13, true, 'Karabasovich','Karabas','Karabasovich', 1, 'Atack', 4), (14, true, 'Uliankin','Anton','Antonovich', 4, 'Defend', 4), (15, true, 'Churilov','Kirill','Evgrafovich', 3, 'Mid', 4), (16, true, 'Kropotkin','Vladimir','Vladimirovich', 1, 'Forward', 4);
INSERT INTO game (id_game, rival_one, rival_two, place_id, id_weeks, res_id, players_id) VALUES (1, 1, 3, 1, 1, 1, 1),(2, 1, 3, 1, 1, 2, 2),(3, 1, 3, 1, 1, 3, 3),(4, 1, 3, 1, 1, 4, 4), (5, 1, 3, 1, 1, 9, 9), (6, 1, 3, 1, 1, 10, 10), (7, 1, 3, 1, 1, 11, 11), (8, 1, 3, 1, 1, 12, 12),(9, 2, 4, 1, 1, 5, 5), (10, 2, 4, 1, 1, 6, 6), (11, 2, 4, 1, 1, 7, 7), (12, 2, 4, 1, 1, 8, 8), (13, 2, 4, 1, 1, 13, 13), (14, 2, 4, 1, 1, 14, 14), (15, 2, 4, 1, 1, 15, 15), (16, 2, 4, 1, 1, 16, 16), (17, 1, 2, 2, 2, 17, 1), (18, 1, 2, 2, 2, 18, 2), (19, 1, 2, 2, 2, 19, 3), (20, 1, 2, 2, 2, 20, 4),(21,1, 2, 2, 2, 21, 5),(22, 1, 2, 2, 2, 22, 6),(23, 1, 2, 2, 2, 23, 7), (24, 1, 2, 2, 2, 24, 8), (25, 3, 4, 2, 2, 25, 9), (26, 3, 4, 2, 2, 26, 10), (27, 3, 4, 2, 2, 27, 11), (28, 3, 4, 2, 2, 28, 12), (29, 3, 4, 2, 2, 29, 13), (30, 3, 4, 2, 2, 30, 14), (31, 3, 4, 2, 2, 31, 15), (32, 3, 4, 2, 2, 32, 16), (33, 1, 4, 3, 3, 33, 1), (34, 1, 4, 3, 3, 34, 2), (35, 1, 4, 3, 3, 35, 3), (36, 1, 4, 3, 3, 36, 4), (37, 1, 4, 3, 3, 45, 13), (38, 1, 4, 3, 3, 46, 14), (39, 1, 4, 3, 3, 47, 15), (40, 1, 4, 3, 3, 48, 16), (41, 2, 3, 3, 3, 37, 5), (42, 2, 3, 3, 3, 38, 6), (43, 2, 3, 3, 3, 39, 7), (44, 2, 3, 3, 3, 40, 8), (45, 2, 3, 3, 3, 41, 9), (46, 2, 3, 3, 3, 42, 10), (47, 2, 3, 3, 3, 43, 11), (48, 2, 3, 3, 3, 44, 12),(49, 1, 2, 4, 4, 49, 1), (50, 1, 2, 4, 4, 50, 2), (51, 1, 2, 4, 4, 51, 3), (52, 1, 2, 4, 4, 52, 4), (53, 1, 2, 4, 4, 53, 5), (54, 1, 2, 4, 4, 54, 6), (55, 1, 2, 4, 4, 55, 7), (56, 1, 2, 4, 4, 56, 8), (57, 3, 4, 4, 4, 57, 9), (58, 3, 4, 4, 4, 58, 10), (59, 3, 4, 4, 4, 59, 11), (60, 3, 4, 4, 4, 60, 12), (61, 3, 4, 4, 4, 61, 13), (62, 3, 4, 4, 4, 62, 14), (63, 3, 4, 4, 4, 63, 15), (64, 3, 4, 4, 4, 64, 16);

CREATE FUNCTION fc1() RETURNS TABLE (match int, goal int, pass int, first_name varchar, last_name varchar, surname varchar) AS $$
SELECT match, goal, pass, first_name, last_name, surname FROM results
INNER JOIN game ON results.id_res = game.res_id
INNER JOIN players ON game.players_id = players.id_players
ORDER BY id_players, match;
$$
LANGUAGE SQL;

CREATE FUNCTION fc2() RETURNS TABLE (total_points int, team_name varchar) AS $$
SELECT (SUM(goal)+SUM(pass)) as total_points, team_name FROM results
INNER JOIN game ON results.id_res = game.res_id
INNER JOIN players ON game.players_id = players.id_players
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN teamn ON league.name_team = teamn.namet_id
GROUP BY team_name;
$$
LANGUAGE SQL;

CREATE FUNCTION fc3() RETURNS TABLE (total_points int, team_name varchar) AS $$
SELECT (SUM(goal)+SUM(pass)) as total_points, team_name FROM results
INNER JOIN game ON results.id_res = game.res_id
INNER JOIN players ON game.players_id = players.id_players
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN teamn ON league.name_team = teamn.namet_id
GROUP BY team_name
ORDER BY total_points DESC;
$$
LANGUAGE SQL;

CREATE FUNCTION fc4(int) RETURNS TABLE (rival_one int, rival_two int) AS $$
SELECT rival_one, rival_two FROM game
INNER JOIN weeks ON game.id_weeks = weeks.weeks_id
WHERE weeks_id = $1
GROUP BY rival_one, rival_two ;
$$
LANGUAGE SQL;

CREATE FUNCTION fc5_1() RETURNS TABLE (goal int, pass int, last_name varchar, first_name varchar, surname varchar) AS $$
SELECT goal, pass, last_name, first_name, surname FROM results
INNER JOIN game ON results.id_res = game.res_id
INNER JOIN players ON game.players_id = players.id_players
WHERE goal + pass = (SELECT MAX(goal + pass) FROM results)
GROUP BY players_id, goal, pass, last_name, first_name, surname ;
$$
LANGUAGE SQL;

CREATE FUNCTION fc5_2() RETURNS TABLE (total_points int, last_name varchar, first_name varchar, surname varchar) AS $$
WITH neededpoints AS (
SELECT (SUM(goal)+ SUM(pass))AS total_points, last_name, first_name, surname FROM players
INNER JOIN game ON players.id_players = game.players_id
INNER JOIN weeks ON game.id_weeks = weeks.weeks_id
INNER JOIN results ON game.res_id = results.id_res
WHERE weeks_id BETWEEN 1 and 3
GROUP BY last_name, first_name, surname
)
SELECT * FROM neededpoints
WHERE total_points = (SELECT MAX(total_points) FROM neededpoints)
$$
LANGUAGE SQL;

CREATE FUNCTION fc5_3() RETURNS TABLE (total_points int, last_name varchar, first_name varchar, surname varchar) AS $$
WITH neededplayers AS(
SELECT SUM(goal+pass) AS points, last_name, first_name, surname FROM players
INNER JOIN address ON players.address_id = address.id_addr
INNER JOIN game ON players.id_players = game.players_id
INNER JOIN results ON game.res_id = results.id_res
GROUP BY last_name,first_name,surname
)
SELECT * FROM neededplayers
WHERE points = (SELECT MAX(points) FROM neededplayers)
$$
LANGUAGE SQL;

CREATE FUNCTION fc6(text) RETURNS TABLE ( last_name varchar, first_name varchar, surname varchar, address varchar) AS $$
SELECT last_name, first_name, surname, address FROM game
INNER JOIN players ON game.players_id = players.id_players
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN teamn ON league.name_team = teamn.namet_id
INNER JOIN address ON players.address_id = address.id_addr
WHERE team_name = $1 
GROUP BY players_id, last_name, first_name, surname, address ;
$$
LANGUAGE SQL;

CREATE FUNCTION fc7(text,int) RETURNS TABLE (total_points int, team_name varchar) as $$
SELECT (SUM(goal)+SUM(pass)) AS total_points, team_name FROM results
INNER JOIN game ON results.id_res = game.res_id
INNER JOIN weeks ON game.id_weeks = weeks.weeks_id
INNER JOIN players ON game.players_id = players.id_players
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN teamn ON league.name_team = teamn.namet_id
WHERE weeks_id BETWEEN 1 AND $2 AND team_name = $1
GROUP BY team_name;
$$
LANGUAGE SQL;

CREATE FUNCTION fc8(text, text) RETURNS TABLE ( team_name varchar, address varchar, number_of_players int) AS $$
SELECT team_name, address, ((COUNT(id_players))/4) AS number_of_players FROM players
INNER JOIN game ON players.id_players = game.players_id
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN teamn ON league.name_team = teamn.namet_id
INNER JOIN address ON players.address_id = address.id_addr
WHERE team_name = $1 AND address = $2
GROUP BY team_name, address;
$$
LANGUAGE SQL;

CREATE FUNCTION fc9(int) RETURNS TABLE (total_points int, last_name varchar, first_name varchar, surname varchar) AS $$
WITH neededpoints AS (
SELECT (SUM(goal)+SUM(pass)) AS total_points,captains.last_name, captains.first_name, captains.surname FROM results
INNER JOIN game ON results.id_res = game.res_id
INNER JOIN players ON game.players_id = players.id_players
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN captains ON league.cap_id = captains.id_cap
WHERE id_res BETWEEN 1 and 16
GROUP BY captains.last_name, captains.first_name, captains.surname
)
SELECT * FROM neededpoints
WHERE total_points > $1
$$
LANGUAGE SQL;

CREATE FUNCTION fc10(text) RETURNS TABLE ( last_name varchar, first_name varchar, surname varchar) AS $$
SELECT last_name, first_name, surname FROM players
WHERE LPAD(last_name,1) = $1
GROUP BY last_name, first_name, surname ;
$$
LANGUAGE SQL;

CREATE FUNCTION fc11(int) RETURNS TABLE (total_points int, last_name varchar, first_name varchar, surname varchar) AS $$
WITH neededpoints AS (
SELECT (SUM(goal)+ SUM(pass))AS total_points, last_name, first_name, surname FROM players
INNER JOIN game ON players.id_players = game.players_id
INNER JOIN weeks ON game.id_weeks = weeks.weeks_id
INNER JOIN results ON game.res_id = results.id_res
WHERE weeks_id BETWEEN 1 and 3
GROUP BY last_name, first_name, surname
)
SELECT * FROM neededpoints
WHERE total_points > $1
$$
LANGUAGE SQL;

CREATE FUNCTION fc12(text, int) RETURNS TABLE (team_name varchar, place varchar, id_weeks int) AS $$
SELECT team_name, place, id_weeks FROM place
INNER JOIN game ON place.id_place = game.place_id
INNER JOIN players ON game.players_id = players.id_players
INNER JOIN weeks ON weeks.weeks_id = game.id_weeks
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN teamn ON league.name_team = teamn.namet_id
WHERE weeks_id = $2 AND team_name = $1
GROUP BY team_name, place, id_weeks; 
$$
LANGUAGE SQL;

CREATE FUNCTION fc13(int, int) RETURNS TABLE (last_name varchar, first_name varchar, surname varchar, rival_one int, rival_two int) AS $$
WITH neededcaps AS(
SELECT captains.last_name, captains.first_name, captains.surname, rival_one, rival_two, cap_id FROM captains
INNER JOIN league ON captains.id_cap = league.cap_id
INNER JOIN players ON league.id_team = players.team_command
INNER JOIN game ON players.id_players = game.players_id
INNER JOIN weeks ON weeks.weeks_id = game.id_weeks
WHERE weeks_id = $2
GROUP BY captains.last_name, captains.first_name, captains.surname, rival_one,rival_two, cap_id
)
SELECT last_name, first_name, surname, rival_one, rival_two FROM neededcaps
WHERE (rival_two = $1 OR rival_one = $1) AND cap_id <> $1
$$
LANGUAGE SQL;

CREATE FUNCTION fc14() RETURNS TABLE (last_name varchar, first_name varchar, surname varchar, "position" varchar, points int) AS $$
WITH RoleTab AS(
SELECT captains.last_name, captains.first_name, captains.surname, "position", SUM(goal+pass) AS points FROM players
INNER JOIN game ON players.id_players = game.players_id
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN captains ON league.cap_id = captains.id_cap	
INNER JOIN results ON game.res_id = results.id_res
WHERE "position" = 'Atack'
GROUP BY captains.last_name,captains.first_name,captains.surname, "position"
)
SELECT * FROM RoleTab
WHERE points = (SELECT MAX(points) FROM RoleTab)
$$
LANGUAGE SQL;

CREATE FUNCTION fc15() RETURNS TABLE (last_name varchar, first_name varchar, surname varchar, "position" varchar, points int) AS $$
WITH RoleTab AS(
SELECT captains.last_name, captains.first_name, captains.surname, "position", SUM(goal+pass) AS points FROM players
INNER JOIN game ON players.id_players = game.players_id
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN captains ON league.cap_id = captains.id_cap	
INNER JOIN results ON game.res_id = results.id_res
WHERE "position" = 'Forward'
GROUP BY captains.last_name,captains.first_name,captains.surname, "position"
)
SELECT * FROM RoleTab
WHERE points = (SELECT MAX(points) FROM RoleTab)
$$
LANGUAGE SQL;

CREATE FUNCTION fc16() RETURNS TABLE (last_name varchar, first_name varchar, surname varchar, "position" varchar, points int) AS $$
WITH RoleTab AS(
SELECT captains.last_name, captains.first_name, captains.surname, "position", SUM(goal+pass) AS points FROM players
INNER JOIN game ON players.id_players = game.players_id
INNER JOIN league ON players.team_command = league.id_team
INNER JOIN captains ON league.cap_id = captains.id_cap	
INNER JOIN results ON game.res_id = results.id_res
GROUP BY captains.last_name,captains.first_name,captains.surname, "position"
)
SELECT * FROM RoleTab
WHERE points = (SELECT MAX(points) FROM RoleTab)
$$
LANGUAGE SQL;

CREATE ROLE operator WITH password '0000' LOGIN;
GRANT SELECT ON place TO operator;
GRANT SELECT ON weeks TO operator;
GRANT SELECT ON results TO operator;
GRANT SELECT ON teamn TO operator;
GRANT SELECT ON address TO operator;
GRANT SELECT ON captains TO operator;
GRANT INSERT ON place TO operator;
GRANT INSERT ON weeks TO operator;
GRANT INSERT ON results TO operator;
GRANT INSERT ON teamn TO operator;
GRANT INSERT ON address TO operator;
GRANT INSERT ON captains TO operator;

CREATE ROLE userr WITH password '1111' LOGIN;
GRANT SELECT ON place TO userr;
GRANT SELECT ON weeks TO userr;
GRANT SELECT ON results TO userr;
GRANT SELECT ON teamn TO userr;
GRANT SELECT ON address TO userr;
GRANT SELECT ON players TO userr;
GRANT SELECT ON game TO userr;
GRANT SELECT ON league TO userr;
GRANT SELECT ON captains TO userr;
GRANT update ON place TO userr;
GRANT update ON weeks TO userr;
GRANT update ON results TO userr;
GRANT update ON teamn TO userr;
GRANT update ON address TO userr;
GRANT update ON players TO userr;
GRANT update ON game TO userr;
GRANT update ON league TO userr;
GRANT update ON captains TO userr;
GRANT delete ON place TO userr;
GRANT delete ON weeks TO userr;
GRANT delete ON results TO userr;
GRANT delete ON teamn TO userr;
GRANT delete ON address TO userr;
GRANT delete ON players TO userr;
GRANT delete ON game TO userr;
GRANT delete ON league TO userr;
GRANT delete ON captains TO userr;

CREATE ROLE admin WITH password '3333' LOGIN;
GRANT ALL PRIVILEGES ON place TO admin;
GRANT ALL PRIVILEGES ON address TO admin;
GRANT ALL PRIVILEGES ON captains TO admin;
GRANT ALL PRIVILEGES ON weeks TO admin;
GRANT ALL PRIVILEGES ON results TO admin;
GRANT ALL PRIVILEGES ON players TO admin;
GRANT ALL PRIVILEGES ON game TO admin;
GRANT ALL PRIVILEGES ON league TO admin;
GRANT ALL PRIVILEGES ON teamn TO admin;

