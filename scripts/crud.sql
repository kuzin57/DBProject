-- SELECT/UPDATE/INSERT/DELETE Queries

-- #1 Join two tables on songwriter name and find country and language of each songwriter
SELECT name, country, language, song_name
FROM music.Songwriters
INNER JOIN music.Songs_songwriters
ON music.Songwriters.name = music.Songs_songwriters.songwriter;

-- #2 Find songs and users who liked the songs
SELECT name, link, user_id
FROM music.Songs
LEFT OUTER JOIN music.Likes
ON music.Songs.name = music.Likes.song_name;

-- #3 Find users and their playlists (with small info)
SELECT user_id, playlists, name, songs
FROM music.Users
LEFT OUTER JOIN music.Playlists
ON music.Users.user_id = music.Playlists.creator_id;

-- #4 Insert two rows to songwriters' table
INSERT INTO music.Songwriters VALUES ('Моргенштерн', 0.0, '2010-01-01', 'Russia', 'Русский');
INSERT INTO music.Songwriters VALUES ('МС Пох', 0.0, NULL, 'Russia', 'Русский');

-- #5 Delete those two rows
DELETE FROM music.Songwriters WHERE name = 'Моргенштерн' or name = 'МС Пох';

-- #6 Add new column 'quality' and set it to 'Perfect' if rating is equal to 10
ALTER TABLE music.Songwriters
ADD quality VARCHAR(50);

UPDATE music.Songwriters
SET quality = 'Perfect'
WHERE rating = 10;

SELECT * FROM music.Songwriters;

-- Drop this column
ALTER TABLE music.Songwriters
DROP COLUMN quality;

-- #7 Find some info about likes and users who liked
SELECT music.Users.user_id, register, privileged, age, song_name, date
FROM music.Users
LEFT OUTER JOIN music.Likes
ON music.Users.user_id = music.Likes.user_id;

-- #8 Add 1 to all ages
UPDATE music.Users
SET age = age + 1;

SELECT * FROM music.Users;

-- Decrement all ages
UPDATE music.Users
SET age = age - 1;

-- #9 Add two rows to countries' table
INSERT INTO music.Countries VALUES ('Thailand', 120, 14);
INSERT INTO music.Countries VALUES ('Uganda', 10, 0);

SELECT * FROM music.Countries;

-- Delete these two rows
DELETE FROM music.Countries WHERE name = 'Thailand' or name = 'Uganda';

-- #10 Count songs on each genre
SELECT COUNT(genre) as genres, genre
FROM music.Songs
GROUP BY genre;