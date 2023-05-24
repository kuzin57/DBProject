-- Table with songwriters is not updated very often as there are not so many 
-- songwriters as, for example, users. It's convenient to create index on
-- songwriter's name as it is the primary key. Other fields can be NULL and 
-- are not unique at all
CREATE UNIQUE INDEX IF NOT EXISTS index_songwriters
ON music.Songwriters (name);

-- Table with albums is not updated very often too, so it's a good idea to
-- create an index on it. Name of the album is unique, date of publishing is
-- not NULL very often and it is almost unique. Also according to statistics 
-- number of songs in album usually varies from 10 to 15. This observation is
-- not valid for our tables as there are only one song in almost each album,
-- but if our database grows, it can be useful
CREATE INDEX IF NOT EXISTS index_albums
ON music.Albums (name, published)
WHERE songs >= 10 AND songs <= 15;

-- We have the same thing that the table with songs is npt updated very often,
-- so it's possible to create an index on it and win in performance. It can be
-- very time-consuming if we create an index on long VARCHAR column. So as song
-- names are usually much longer than band names or album names we should not
-- add name column to the list of columns in index definition. We will stop on
-- published and duration columns. Usually they are pretty unique and moreover
-- the comparison on the types of these columns works quickly
CREATE INDEX IF NOT EXISTS index_songs
ON music.Songs (published, duration);

-- Similar to previous ones. (Creator_id is a quite unique and short field)
CREATE INDEX IF NOT EXISTS index_playlists
ON music.Playlists (creator_id, created);

-- Song_name column is more unique in this table than the songwriter column
CREATE INDEX IF NOT EXISTS index_songs_songwriters
ON music.Songs_songwriters (song_name);

-- Same as previous
CREATE INDEX IF NOT EXISTS index_albums_songwriters
ON music.Albums_songwriters (album_name);

-- Same as previous
CREATE INDEX IF NOT EXISTS index_albums_songs
ON music.Albums_songs (album_name);

-- Same as previous
CREATE INDEX IF NOT EXISTS index_playlists_songs
ON music.Playlists_songs (playlist);

-- I did not create indexes on tables music.Users and music.Likes as these
-- tables change very often. Also I did not create indexes on tables 
-- music.Forbidden and music.Countries as there are not many rows