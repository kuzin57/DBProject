-- SELECT Queries, using GROUP BY + HAVING, ORDER BY, window functions

-- #1 Count the number of different genres per each songwriter
SELECT songwriter, COUNT(genre) as genres
FROM (
    SELECT music.Songwriters.name as songwriter, song_name
    FROM music.Songwriters
    LEFT OUTER JOIN music.Songs_songwriters
    ON music.Songwriters.name = music.Songs_songwriters.songwriter
) as songwriters_songs
LEFT OUTER JOIN music.Songs
ON songwriters_songs.song_name = music.Songs.name
GROUP BY songwriters_songs.songwriter;

-- #2 Count average rating and number of songwriters per countries
SELECT country, avg_rating, songwriters_cnt
FROM (
    SELECT
        country,
        AVG(rating) OVER (PARTITION BY country) as avg_rating,
        ROW_NUMBER() OVER (PARTITION BY country) as row_num,
        COUNT(*) OVER (PARTITION BY country) as songwriters_cnt
    FROM music.Songwriters
) as subquery
WHERE row_num = 1
ORDER BY avg_rating DESC;

-- #3 Count the number of likes per songwriter
SELECT DISTINCT
name, COUNT(user_id) OVER (PARTITION BY name) as likes_cnt
FROM (
    SELECT name, song_name
    FROM music.Songwriters
    LEFT OUTER JOIN music.Songs_songwriters
    ON music.Songwriters.name = music.Songs_songwriters.songwriter
) as subquery
LEFT OUTER JOIN music.Likes
ON subquery.song_name = music.Likes.song_name;

-- #4 Find users who liked at least 2 songs
SELECT user_id, COUNT(*) as likes_cnt
FROM music.likes
GROUP BY user_id
HAVING COUNT(*) >= 2;

-- #5 Find best 5 playlists (based on number of likes)
SELECT DISTINCT
name, likes_cnt
FROM (
    SELECT name, playlist_song.song_name, COUNT(user_id) OVER (PARTITION BY name) as likes_cnt
    FROM (
        SELECT name, song_name
        FROM music.Playlists
        LEFT OUTER JOIN music.Playlists_songs
        ON music.Playlists.name = music.Playlists_songs.playlist
    ) as playlist_song
    LEFT OUTER JOIN music.Likes
    ON music.Likes.song_name = playlist_song.song_name
) as subquery
ORDER BY likes_cnt DESC
LIMIT 5;

-- #6 Find albums which were published after 1980, and their authors, also sort albums by published date
SELECT subquery.name, album_name, published
FROM (
    SELECT name, album_name
    FROM music.Songwriters
    LEFT OUTER JOIN music.Albums_songwriters
    ON music.Songwriters.name = music.Albums_songwriters.songwriter
) as subquery
LEFT OUTER JOIN music.Albums
ON subquery.album_name = music.Albums.name
WHERE music.Albums.published > '1980-01-01'
ORDER BY published;
