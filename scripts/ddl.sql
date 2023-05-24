CREATE SCHEMA IF NOT EXISTS music;

CREATE TABLE IF NOT EXISTS music.Users (
    user_id VARCHAR(50) PRIMARY KEY,
    password VARCHAR(200) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    register DATE,
    birthdate DATE,
    privileged BOOLEAN NOT NULL,
    playlists SMALLINT,
    email VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS music.Playlists (
    name VARCHAR(200) PRIMARY KEY,
    created DATE,
    creator_id VARCHAR(50) NOT NULL,
    songs SMALLINT
);

CREATE TABLE IF NOT EXISTS music.Songs (
    name VARCHAR(200) PRIMARY KEY,
    published DATE,
    duration TIME,
    link VARCHAR(600) NOT NULL,
    age_restriction BOOLEAN NOT NULL,
    genre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS music.Countries (
    name VARCHAR(50) PRIMARY KEY,
    users BIGINT,
    songwriters BIGINT
);

CREATE TABLE IF NOT EXISTS music.Albums (
    name VARCHAR(200) PRIMARY KEY,
    published DATE,
    songs SMALLINT
);

CREATE TABLE IF NOT EXISTS music.Likes (
    song_name VARCHAR(200) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    date DATE
);

CREATE TABLE IF NOT EXISTS music.Songwriters (
    name VARCHAR(100) PRIMARY KEY,
    rating FLOAT,
    activity_beginning DATE,
    country VARCHAR(50),
    language VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS music.Forbidden (
    song_name VARCHAR(200) NOT NULL,
    country VARCHAR(50) NOT NULL,
    reason VARCHAR(300),
    date DATE
);

CREATE TABLE IF NOT EXISTS music.Playlists_songs (
    song_name VARCHAR(200) NOT NULL,
    playlist VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS music.Albums_songs (
    song_name VARCHAR(200) NOT NULL,
    album_name VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS music.Albums_songwriters (
    songwriter VARCHAR(100) NOT NULL,
    album_name VARCHAR(200) NOT NULL  
);

CREATE TABLE IF NOT EXISTS music.Songs_songwriters (
    song_name VARCHAR(200) NOT NULL,
    songwriter VARCHAR(100) NOT NULL
);

-- Versioning tables
CREATE TABLE IF NOT EXISTS music.Users_history (
    user_id VARCHAR(50),
    password VARCHAR(200) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    privileged BOOLEAN NOT NULL,
    playlists SMALLINT,
    email VARCHAR(200),
    change_time TIMESTAMP
);

CREATE TABLE IF NOT EXISTS music.Playlists_history (
    name VARCHAR(200),
    creator_id VARCHAR(50) NOT NULL,
    songs SMALLINT,
    change_time TIMESTAMP
);