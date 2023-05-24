-- #1
-- We should hide the password and
-- some personal info when user try
-- to make a query to the users' table
CREATE OR REPLACE VIEW music.User_view AS
SELECT
REPLACE(user_id, SUBSTRING(user_id from 2 for 3), REPEAT('*', 3)) as hidden_user_id,
country,
register,
playlists
FROM music.Users;

SELECT * FROM music.User_view;

-- #2
-- We should create a view for likes 
-- which will contain likes from users who
-- do not live in Russia or Belarus (countries
-- with difficult political situation)
CREATE OR REPLACE VIEW music.Likes_view AS
SELECT
REPLACE(music.Users.user_id,
        SUBSTRING(
            music.Users.user_id from 2 for 3),
            REPEAT('*', 3)) as hidden_user_id,
song_name,
date
FROM music.Likes
INNER JOIN music.Users
ON music.Users.user_id = music.Likes.user_id
WHERE country != 'Russia' AND country != 'Belarus'

SELECT * FROM music.Likes_view;

-- #3
-- Information about users and songs which are not
-- allowed to listen to in the country (to avoid
-- problems with law)
CREATE OR REPLACE VIEW music.Forbidden_songs_view AS
SELECT
REPLACE(music.Users.user_id,
        SUBSTRING(
            music.Users.user_id from 2 for 3),
            REPEAT('*', 3)) as hidden_user_id,
name,
music.Users.country
FROM music.Users
JOIN (
    SELECT
    name,
    country
    FROM music.Songs
    JOIN music.Forbidden
    ON music.Songs.name = music.Forbidden.song_name
) AS subquery
ON music.Users.country = subquery.country;

SELECT * FROM music.Forbidden_songs_view;

-- #4
-- Sometimes we need the whole list of songs and
-- bands and albums, that's why this view can be
-- useful
CREATE OR REPLACE VIEW music.Bands_songs_albums AS
SELECT
songwriter AS band,
album_name AS album,
music.Albums_songs.song_name AS song
FROM music.Albums_songs
JOIN music.Songs_songwriters
ON music.Albums_songs.song_name =
    music.Songs_songwriters.song_name
ORDER BY (songwriter,
          album_name,
          music.Albums_songs.song_name);

SELECT * FROM music.Bands_songs_albums;

-- #5
-- It can be useful to get the information about
-- total duration of an each album
CREATE OR REPLACE VIEW music.Album_durations AS
SELECT DISTINCT
album_name,
CAST (duration AS TIME) AS duration
FROM (
    SELECT
    album_name,
    SUM(duration) OVER
    (PARTITION BY album_name) AS duration
    FROM music.Albums_songs
    JOIN music.Songs
    ON music.Albums_songs.song_name =
        music.Songs.name
) AS subquery;

SELECT * FROM music.Album_durations;

-- #6
-- Information about songs, users and playlists
-- user ids are hidden again
CREATE OR REPLACE VIEW music.Songs_users_playlists AS
SELECT
song_name,
REPLACE(user_id,
        SUBSTRING(
            user_id from 2 for 3),
            REPEAT('*', 3)) as hidden_user_id,
playlist
FROM (
    SELECT user_id, name
    FROM music.Playlists
    JOIN music.Users
    ON music.Users.user_id =
        music.Playlists.creator_id
) AS subquery
JOIN music.Playlists_songs
ON music.Playlists_songs.playlist =
    subquery.name;

SELECT * FROM music.Songs_users_playlists;