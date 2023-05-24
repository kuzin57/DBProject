-- Songwriters
INSERT INTO music.Songwriters VALUES ('Led Zeppelin', 9.8, '1968-09-01'::date, 'England', 'English');
INSERT INTO music.Songwriters VALUES ('Aerosmith', 9.5, '1970-11-06'::date, 'USA', 'English');
INSERT INTO music.Songwriters VALUES ('AC/DC', 10.0, '1973-12-30'::date, 'Australia', 'English');
INSERT INTO music.Songwriters VALUES ('Black Sabbath', 9.5, '1968-12-01'::date, 'England', 'English');
INSERT INTO music.Songwriters VALUES ('Guns n roses', 9.5, '1985-03-01'::date, 'USA', 'English');
INSERT INTO music.Songwriters VALUES ('Rammstein', 8.5, '1994-01-01'::date, 'Germany', 'German');
INSERT INTO music.Songwriters VALUES ('Машина времени', 10.0, '1969-05-27'::date, 'Russia', 'Russian');
INSERT INTO music.Songwriters VALUES ('Пикник', 9.8, '1978-09-01'::date, 'Russia', 'Russian');
INSERT INTO music.Songwriters VALUES ('Queen', 10.0, '1970-03-01'::date, 'England', 'English');
INSERT INTO music.Songwriters VALUES ('Pink Floyd', 10.0, '1970-10-01'::date, 'England', 'English');
INSERT INTO music.Songwriters VALUES ('Крематорий', 9.5, '1983-01-01'::date, 'Russia', 'Russian');
INSERT INTO music.Songwriters VALUES ('Scorpions', 9.8, '1965-01-01'::date, 'Germany', 'English');
INSERT INTO music.Songwriters VALUES ('Nirvana', 10.0, '1987-01-01'::date, 'USA', 'English');


SELECT * FROM music.Songwriters;

DELETE FROM music.Songwriters;

-- Songs
INSERT INTO music.Songs VALUES ('Stairway to Heaven', '1971-11-08'::date, '00:08:01', 'https://www.youtube.com/watch?v=QkF3oxziUI4', FALSE, 'Hard rock');
INSERT INTO music.Songs VALUES ('Wind of change', '1991-01-21'::date, '00:05:13', 'https://www.youtube.com/watch?v=n4RjJKxsamQ', FALSE, 'Rock');
INSERT INTO music.Songs VALUES ('Shine on you Crazy Diamond', '1975-09-15'::date, '00:26:00', 'https://www.youtube.com/watch?v=cWGE9Gi0bB0', FALSE, 'Art rock');
INSERT INTO music.Songs VALUES ('Поворот', '1979-01-01'::date, '00:03:38', 'https://www.youtube.com/watch?v=6cw-vz7vS-8', FALSE, 'Russian rock');
INSERT INTO music.Songs VALUES ('Du hast', '1997-07-21'::date, '00:03:55', 'https://www.youtube.com/watch?v=W3q8Od5qJio', FALSE, 'Industrial metal');
INSERT INTO music.Songs VALUES ('Bohemian rhapsody', '1975-10-31'::date, '00:05:55', 'https://www.youtube.com/watch?v=fJ9rUzIMcZQ', FALSE, 'Hard rock');
INSERT INTO music.Songs VALUES ('Thunderstruck', '1990-09-10'::date, '00:04:52', 'https://www.youtube.com/watch?v=v2AC41dglnM', FALSE, 'Hard rock');
INSERT INTO music.Songs VALUES ('Crazy', '1994-05-03'::date, '00:05:16', 'https://www.youtube.com/watch?v=NMNgbISmF4I', FALSE, 'Blues rock');
INSERT INTO music.Songs VALUES ('Breathe', '1973-03-01'::date, '00:02:47', 'https://www.youtube.com/watch?v=mrojrDCI02k', FALSE, 'Psychedelic rock');
INSERT INTO music.Songs VALUES ('За тех, кто в море', '1986-01-01'::date, '00:03:50', 'https://www.youtube.com/watch?v=ScuyHRsr2qI', FALSE, 'Russian rock');
INSERT INTO music.Songs VALUES ('Paranoid', '1970-08-07'::date, '00:02:48', 'https://www.youtube.com/watch?v=BOTIIw76qiE', FALSE, 'Heavy metal');
INSERT INTO music.Songs VALUES ('Black Sabbath', '1970-02-13'::date, '00:06:16', 'https://www.youtube.com/watch?v=0lVdMbUx1_k', FALSE, 'Heavy metal');
INSERT INTO music.Songs VALUES ('November rain', '1992-02-01'::date, '00:08:57', 'https://www.youtube.com/watch?v=8SbUC-UaAxE', FALSE, 'Rock');
INSERT INTO music.Songs VALUES ('Иероглиф', '1986-01-01'::date, '00:06:16', 'https://www.youtube.com/watch?v=TxOCo2XI3AU', FALSE, 'Russian rock');
INSERT INTO music.Songs VALUES ('Фиолетово-чёрный', '2001-01-01'::date, '00:03:33', 'https://www.youtube.com/watch?v=Wbp3gMD8sp0', FALSE, 'Psychodelic rock');
INSERT INTO music.Songs VALUES ('Таня', '1983-01-01'::date, '00:04:06', 'https://www.youtube.com/watch?v=lxJJ1gum2u4', FALSE, 'Russian rock');
INSERT INTO music.Songs VALUES ('Мусорный ветер', '1988-01-01'::date, '00:02:58', 'https://www.youtube.com/watch?v=kuI9FNadcew', FALSE, 'Russian rock');
INSERT INTO music.Songs VALUES ('Sonne', '2001-02-12'::date, '00:04:32', 'https://www.youtube.com/watch?v=StZcUAPRRac', FALSE, 'Industrial metal');
INSERT INTO music.Songs VALUES ('Sweet emotion', '1975-05-19'::date, '00:04:34', 'https://www.youtube.com/watch?v=33ClrPlzuVQ', FALSE, 'Hard rock');
INSERT INTO music.Songs VALUES ('Back in Black', '1980-12-01'::date, '00:04:14', 'https://www.youtube.com/watch?v=pAgnJDJN4VA', FALSE, 'Hard rock');
INSERT INTO music.Songs VALUES ('Sweet child o Mine', '1988-08-17'::date, '00:05:56', 'https://www.youtube.com/watch?v=1w7OgIMMRc4', FALSE, 'Hard rock');
INSERT INTO music.Songs VALUES ('Welcome to the Jungle', '1987-10-03'::date, '00:05:56', 'https://www.youtube.com/watch?v=o1tj2zJ2Wvg', FALSE, 'Hard rock');
INSERT INTO music.Songs VALUES ('Come as you are', '1992-03-03'::date, '00:03:39', 'https://www.youtube.com/watch?v=vabnZ9-ex7o', FALSE, 'Grange');
INSERT INTO music.Songs VALUES ('Lithium', '1992-07-21'::date, '00:04:16', 'https://www.youtube.com/watch?v=pkcJEvMcnEg', FALSE, 'Grange');
INSERT INTO music.Songs VALUES ('Smells like teen spirit', '1992-01-27'::date, '00:03:42', 'https://www.youtube.com/watch?v=FklUAoZ6KxY', FALSE, 'Grange');
INSERT INTO music.Songs VALUES ('Send me an angel', '1991-09-17'::date, '00:04:32', 'https://www.youtube.com/watch?v=1UUYjd2rjsE', FALSE, 'Glam metal');
INSERT INTO music.Songs VALUES ('Whole lotta love', '1969-11-07'::date, '00:05:33', 'https://www.youtube.com/watch?v=HQmmM_qwG4k', FALSE, 'Blues rock');
INSERT INTO music.Songs VALUES ('Kashmir', '1975-02-24'::date, '00:08:29', 'https://www.youtube.com/watch?v=PD-MdiUm1_Y', FALSE, 'Hard rock');
INSERT INTO music.Songs VALUES ('Show must go on', '1991-10-14'::date, '00:04:31', 'https://www.youtube.com/watch?v=t99KH0TR-J4', FALSE, 'Hard rock');

SELECT * FROM music.Songs;

DELETE FROM music.Songs;

-- Users
INSERT INTO music.Users VALUES ('s1Xgh', 'jfvndjdfdjvn', 'Ivan', 'Ivanov', 'Russia', '2019-03-05', '1987-06-04', FALSE, 0, 'ivan.ivanov@gmail.com');
INSERT INTO music.Users VALUES ('vb45J', '1234&&fdhb', 'Enzo', 'Fernandes', 'Spain', '2021-11-13', '1979-09-11', FALSE, 1, 'enzo1979@yahoo.com');
INSERT INTO music.Users VALUES ('12WWg', '11ww34n;5uf', 'Andreas', 'Ericsson', 'Sweden', '2016-01-21', '2005-02-06', FALSE, 2, 'ericsssson19919@gmail.com');
INSERT INTO music.Users VALUES ('fGF3K', 'jdfndjvn', 'Andrey', 'Morozov', 'Russia', '2022-06-02', '2003-05-09', FALSE, 0, 'morozov.andrey@mail.ru');
INSERT INTO music.Users VALUES ('3eDr4', 'fdjnjdnfjn', 'Sergei', 'Kornilenko', 'Belarus', '2019-07-15', '1998-01-18', FALSE, 1, 'kornilserg@yandex.ru');
INSERT INTO music.Users VALUES ('gH321', '4345fnvjv', 'James', 'Wood', 'USA', '2020-12-12', '1977-12-28', FALSE, 2, 'wood.james.1977@gmail.com');
INSERT INTO music.Users VALUES ('Oi3JL', 'dfjj122ax@@fd', 'Nicholae', 'Stanciu', 'Romania', '2017-05-10', '1981-05-25', FALSE, 4, 'stanciu1981@yahoo.com');
INSERT INTO music.Users VALUES ('gJJ8Y', 'fdjn323()54j', 'Peter', 'Nilsen', 'Germany', '2016-07-01', '2006-11-02', FALSE, 1, 'peterthebest@gmail.com');
INSERT INTO music.Users VALUES ('OCX54', '!vnjn', 'Harry', 'Kane', 'England', '2019-04-11', '2006-12-12', FALSE, 0, 'kanekane@yahoo.com');
INSERT INTO music.Users VALUES ('JkS1A', '4jfj2003@@', 'Aaron', 'Ramsdale', 'England', '2018-11-23', '1963-08-17', FALSE, 0, 'ramsdale.1963@gmail.com');
INSERT INTO music.Users VALUES ('111Fc', 'skmkmkml99f9', 'Joe', 'Gomez', 'USA', '2017-09-14', '1980-01-03', FALSE, 0, 'gomezz.joe@yahoo.com');
INSERT INTO music.Users VALUES ('wX2C3', 'jnfj0949jdfn', 'Si', 'Chan', 'China', '2022-10-12', '1995-03-01', FALSE, 0, 'chan.si.1995@sina.com');
INSERT INTO music.Users VALUES ('gQdZ2', 'owo223c', 'Andrew', 'Robertson', 'USA', '2020-02-03', '1986-04-07', FALSE, 0, 'andrew1986@gmail.com');
INSERT INTO music.Users VALUES ('5FbN1', '2njn$sjn', 'Max', 'Klassen', 'USA', '2020-01-03', '2009-10-06', FALSE, 0, 'klass@yahoo.com');
INSERT INTO music.Users VALUES ('6TtIO', 'sjnfjSS2', 'Kristian', 'Eriksen', 'Denmark', '2021-07-07', '2008-09-01', FALSE, 0, 'kristian.eriksen@gmail.com');
INSERT INTO music.Users VALUES ('7ujKL', 'DjnfgjU23%', 'Olivier', 'Giroud', 'France', '2019-11-11', '2001-08-14', FALSE, 0, 'olivier2001@yahoo.com');

SELECT * FROM music.Users;
DELETE FROM music.Users;

-- Playlists
INSERT INTO music.Playlists VALUES ('My favourite songs', '2019-04-01', 'vb45J', 3);
INSERT INTO music.Playlists VALUES ('Best rock songs', '2019-11-15', '12WWg', 3);
INSERT INTO music.Playlists VALUES ('Playlist1', '2020-12-25', '3eDr4', 3);
INSERT INTO music.Playlists VALUES ('Playlist for running', '2020-12-25', '12WWg', 7);
INSERT INTO music.Playlists VALUES ('Playlist lalalala', '2022-08-04', 'gH321', 1);
INSERT INTO music.Playlists VALUES ('My best playlist', '2021-04-04', 'gH321', 2);
INSERT INTO music.Playlists VALUES ('Rock', '2019-06-03', 'Oi3JL', 3);
INSERT INTO music.Playlists VALUES ('Yeee', '2018-11-21', 'Oi3JL', 1);
INSERT INTO music.Playlists VALUES ('For bad mood', '2020-11-30', 'Oi3JL', 2);
INSERT INTO music.Playlists VALUES ('To relax', '2021-12-02', 'Oi3JL', 3);
INSERT INTO music.Playlists VALUES ('Playlist', '2017-10-14', 'gJJ8Y', 1);

SELECT * FROM music.Playlists;
DELETE FROM music.Playlists;

-- Countries;

INSERT INTO music.Countries VALUES ('England', 2, 4);
INSERT INTO music.Countries VALUES ('Spain', 1, 0);
INSERT INTO music.Countries VALUES ('Germany', 1, 2);
INSERT INTO music.Countries VALUES ('Romania', 1, 0);
INSERT INTO music.Countries VALUES ('Belarus', 1, 0);
INSERT INTO music.Countries VALUES ('USA', 4, 3);
INSERT INTO music.Countries VALUES ('China', 1, 0);
INSERT INTO music.Countries VALUES ('Sweden', 1, 0);
INSERT INTO music.Countries VALUES ('Denmark', 1, 0);
INSERT INTO music.Countries VALUES ('France', 1, 0);
INSERT INTO music.Countries VALUES ('Australia', 0, 1);

SELECT * FROM music.Countries;
DELETE FROM music.Countries;

-- Albums
INSERT INTO music.Albums VALUES ('Led Zeppelin IV', '1971-11-08', 1);
INSERT INTO music.Albums VALUES ('Led Zeppelin II', '1969-10-22', 1);
INSERT INTO music.Albums VALUES ('Crazy world', '1990-11-06', 2);
INSERT INTO music.Albums VALUES ('Wish you were here', '1975-09-12', 1);
INSERT INTO music.Albums VALUES ('Десять лет спустя', '1987-10-01', 1);
INSERT INTO music.Albums VALUES ('Sehnsucht', '1997-08-22', 1);
INSERT INTO music.Albums VALUES ('A Night at the Opera', '1975-11-21', 1);
INSERT INTO music.Albums VALUES ('The razor s edge', '1990-09-21', 1);
INSERT INTO music.Albums VALUES ('Get a Grip', '1993-04-01', 1);
INSERT INTO music.Albums VALUES ('The Dark Side of the Moon', '1973-03-10', 1);
INSERT INTO music.Albums VALUES ('В добрый час', '1986-01-01', 1);
INSERT INTO music.Albums VALUES ('Paranoid', '1970-09-18', 1);
INSERT INTO music.Albums VALUES ('Black Sabbath', '1971-02-13', 1);
INSERT INTO music.Albums VALUES ('Use Your Illusion I', '1991-09-17', 1);
INSERT INTO music.Albums VALUES ('Иероглиф', '1986-01-01', 1);
INSERT INTO music.Albums VALUES ('Египтянин', '2001-01-01', 1);
INSERT INTO music.Albums VALUES ('Винные мемуары', '1983-01-01', 1);
INSERT INTO music.Albums VALUES ('Sonne', '2001-02-12', 1);
INSERT INTO music.Albums VALUES ('Toys in the Attic', '1975-04-08', 1);
INSERT INTO music.Albums VALUES ('Back in Black', '1980-07-25', 1);
INSERT INTO music.Albums VALUES ('Appetite for Destruction', '1987-07-21', 2);
INSERT INTO music.Albums VALUES ('Nevermind', '1991-09-24', 3);
INSERT INTO music.Albums VALUES ('Innuendo', '1991-02-04', 1);
INSERT INTO music.Albums VALUES ('Physical Graffiti', '1975-02-24', 1);

SELECT * FROM music.Albums;
DELETE FROM music.Albums;

-- Likes
INSERT INTO music.Likes VALUES ('Come as you are', 'gH321', '2020-12-11');
INSERT INTO music.Likes VALUES ('November rain', '6TtIO', '2022-10-25');
INSERT INTO music.Likes VALUES ('Back in Black', '7ujKL', '2023-02-16');
INSERT INTO music.Likes VALUES ('Back in Black', 'Oi3JL', '2020-12-11');
INSERT INTO music.Likes VALUES ('Back in Black', 'wX2C3', '2023-01-01');
INSERT INTO music.Likes VALUES ('Smells like teen spirit', 'wX2C3', '2023-01-02');
INSERT INTO music.Likes VALUES ('Smells like teen spirit', 'fGF3K', '2022-12-20');
INSERT INTO music.Likes VALUES ('За тех, кто в море', 's1Xgh', '2020-05-17');
INSERT INTO music.Likes VALUES ('Shine on you Crazy Diamond', 'OCX54', '2019-06-22');
INSERT INTO music.Likes VALUES ('Shine on you Crazy Diamond', 'gJJ8Y', '2017-08-10');
INSERT INTO music.Likes VALUES ('Thunderstruck', '3eDr4', '2021-09-01');
INSERT INTO music.Likes VALUES ('Breathe', '6TtIO', '2022-11-05');

SELECT * FROM music.Likes;
DELETE FROM music.Likes;

-- Forbidden
INSERT INTO music.Forbidden VALUES ('Smells like teen spirit', 'Belarus', 'Drugs propaganda', '2020-11-11');
INSERT INTO music.Forbidden VALUES ('Smells like teen spirit', 'Russia', 'Drugs propaganda', '2020-11-13');
INSERT INTO music.Forbidden VALUES ('Sweet emotion', 'Spain', 'Political reasons', '2015-10-05');
INSERT INTO music.Forbidden VALUES ('Sweet emotion', 'France', 'Political reasons', '2017-06-06');
INSERT INTO music.Forbidden VALUES ('Фиолетово-чёрный', 'Belarus', 'Оскорбление чувств верующих', '2017-03-01');
INSERT INTO music.Forbidden VALUES ('Wind of change', 'Russia', 'Political reasons', '2022-02-25');
INSERT INTO music.Forbidden VALUES ('Wind of change', 'Belarus', 'Political reasons', '2022-02-25');
INSERT INTO music.Forbidden VALUES ('За тех, кто в море', 'Russia', 'Political reasons', '2022-02-25');
INSERT INTO music.Forbidden VALUES ('За тех, кто в море', 'Belarus', 'Political reasons', '2022-02-25');
INSERT INTO music.Forbidden VALUES ('Lithium', 'Russia', 'Political reasons', '2021-01-16');

SELECT * FROM music.Forbidden;
DELETE FROM music.Forbidden;

-- Playlists_songs
INSERT INTO music.Playlists_songs VALUES ('Send me an angel', 'My favourite songs');
INSERT INTO music.Playlists_songs VALUES ('Wind of change', 'My favourite songs');
INSERT INTO music.Playlists_songs VALUES ('Back in Black', 'My favourite songs');
INSERT INTO music.Playlists_songs VALUES ('Stairway to Heaven', 'Best rock songs');
INSERT INTO music.Playlists_songs VALUES ('Kashmir', 'Best rock songs');
INSERT INTO music.Playlists_songs VALUES ('Sweet emotion', 'Best rock songs');
INSERT INTO music.Playlists_songs VALUES ('Sonne', 'Playlist1');
INSERT INTO music.Playlists_songs VALUES ('Lithium', 'Playlist1');
INSERT INTO music.Playlists_songs VALUES ('Stairway to Heaven', 'Playlist1');
INSERT INTO music.Playlists_songs VALUES ('Back in Black', 'Playlist for running');
INSERT INTO music.Playlists_songs VALUES ('Thunderstruck', 'Playlist for running');
INSERT INTO music.Playlists_songs VALUES ('Crazy', 'Playlist for running');
INSERT INTO music.Playlists_songs VALUES ('Lithium', 'Playlist for running');
INSERT INTO music.Playlists_songs VALUES ('Sonne', 'Playlist for running');
INSERT INTO music.Playlists_songs VALUES ('Du hast', 'Playlist for running');
INSERT INTO music.Playlists_songs VALUES ('Kashmir', 'Playlist for running');
INSERT INTO music.Playlists_songs VALUES ('Stairway to Heaven', 'Playlist lalalala');
INSERT INTO music.Playlists_songs VALUES ('Stairway to Heaven', 'My best playlist');
INSERT INTO music.Playlists_songs VALUES ('Bohemian rhapsody', 'My best playlist');
INSERT INTO music.Playlists_songs VALUES ('Back in Black', 'Rock');
INSERT INTO music.Playlists_songs VALUES ('Show must go on', 'Rock');
INSERT INTO music.Playlists_songs VALUES ('Sonne', 'Rock');
INSERT INTO music.Playlists_songs VALUES ('Thunderstruck', 'Yeee');
INSERT INTO music.Playlists_songs VALUES ('Shine on you Crazy Diamond', 'For bad mood');
INSERT INTO music.Playlists_songs VALUES ('Breathe', 'For bad mood');
INSERT INTO music.Playlists_songs VALUES ('Breathe', 'To relax');
INSERT INTO music.Playlists_songs VALUES ('Stairway to Heaven', 'To relax');
INSERT INTO music.Playlists_songs VALUES ('Wind of change', 'To relax');
INSERT INTO music.Playlists_songs VALUES ('Smells like teen spirit', 'Playlist');

SELECT * FROM music.Playlists_songs;
DELETE FROM music.Playlists_songs;

-- Albums_songs
INSERT INTO music.Albums_songs VALUES ('Stairway to Heaven', 'Led Zeppelin IV');
INSERT INTO music.Albums_songs VALUES ('Wind of change', 'Crazy world');
INSERT INTO music.Albums_songs VALUES ('Shine on you Crazy Diamond', 'Wish you were here');
INSERT INTO music.Albums_songs VALUES ('Поворот', 'Десять лет спустя');
INSERT INTO music.Albums_songs VALUES ('Du hast', 'Sehnsucht');
INSERT INTO music.Albums_songs VALUES ('Bohemian rhapsody', 'A Night at the Opera');
INSERT INTO music.Albums_songs VALUES ('Thunderstruck', 'The razor s edge');
INSERT INTO music.Albums_songs VALUES ('Crazy', 'Get a Grip');
INSERT INTO music.Albums_songs VALUES ('Breathe', 'The Dark Side of the Moon');
INSERT INTO music.Albums_songs VALUES ('За тех, кто в море', 'В добрый час');
INSERT INTO music.Albums_songs VALUES ('Paranoid', 'Paranoid');
INSERT INTO music.Albums_songs VALUES ('Black Sabbath', 'Black Sabbath');
INSERT INTO music.Albums_songs VALUES ('November rain', 'Use your Illusion I');
INSERT INTO music.Albums_songs VALUES ('Иероглиф', 'Иероглиф');
INSERT INTO music.Albums_songs VALUES ('Фиолетово-чёрный', 'Египтянин');
INSERT INTO music.Albums_songs VALUES ('Таня', 'Винные мемуары');
INSERT INTO music.Albums_songs VALUES ('Мусорный ветер', 'Кома');
INSERT INTO music.Albums_songs VALUES ('Sonne', 'Sonne');
INSERT INTO music.Albums_songs VALUES ('Sweet emotion', 'Toys in the Attic');
INSERT INTO music.Albums_songs VALUES ('Back in Black', 'Back in Black');
INSERT INTO music.Albums_songs VALUES ('Sweet child o Mine', 'Appetite for Destruction');
INSERT INTO music.Albums_songs VALUES ('Welcome to the Jungle', 'Appetite for Destruction');
INSERT INTO music.Albums_songs VALUES ('Come as you are', 'Nevermind');
INSERT INTO music.Albums_songs VALUES ('Lithium', 'Nevermind');
INSERT INTO music.Albums_songs VALUES ('Smells like teen spirit', 'Nevermind');
INSERT INTO music.Albums_songs VALUES ('Send me an angel', 'Crazy world');
INSERT INTO music.Albums_songs VALUES ('Whole lotta love', 'Led Zeppelin II');
INSERT INTO music.Albums_songs VALUES ('Kashmir', 'Physical Graffiti');
INSERT INTO music.Albums_songs VALUES ('Show must go on', 'Innuendo');

SELECT * FROM music.Albums_songs;
DELETE FROM music.Albums_songs;

-- Albums_songwriters
INSERT INTO music.Albums_songwriters VALUES ('Queen', 'Innuendo');
INSERT INTO music.Albums_songwriters VALUES ('Queen', 'A Night at the Opera');
INSERT INTO music.Albums_songwriters VALUES ('Black Sabbath', 'Black Sabbath');
INSERT INTO music.Albums_songwriters VALUES ('Black Sabbath', 'Paranoid');
INSERT INTO music.Albums_songwriters VALUES ('Пикник', 'Иероглиф');
INSERT INTO music.Albums_songwriters VALUES ('Пикник', 'Египтянин');
INSERT INTO music.Albums_songwriters VALUES ('Nirvana', 'Nevermind');
INSERT INTO music.Albums_songwriters VALUES ('Машина времени', 'Десять лет спустя');
INSERT INTO music.Albums_songwriters VALUES ('Машина времени', 'В добрый час');
INSERT INTO music.Albums_songwriters VALUES ('Aerosmith', 'Get a Grip');
INSERT INTO music.Albums_songwriters VALUES ('Aerosmith', 'Toys in the Attic');
INSERT INTO music.Albums_songwriters VALUES ('Крематорий', 'Винные мемуары');
INSERT INTO music.Albums_songwriters VALUES ('Крематорий', 'Кома');
INSERT INTO music.Albums_songwriters VALUES ('Rammstein', 'Sonne');
INSERT INTO music.Albums_songwriters VALUES ('Rammstein', 'Sehnsucht');
INSERT INTO music.Albums_songwriters VALUES ('Led Zeppelin', 'Led Zeppelin II');
INSERT INTO music.Albums_songwriters VALUES ('Led Zeppelin', 'Led Zeppelin IV');
INSERT INTO music.Albums_songwriters VALUES ('Led Zeppelin', 'Physical Graffiti');
INSERT INTO music.Albums_songwriters VALUES ('Scorpions', 'Crazy world');
INSERT INTO music.Albums_songwriters VALUES ('Guns n roses', 'Appetite for Destruction');
INSERT INTO music.Albums_songwriters VALUES ('Guns n roses', 'Use your Illusion I');
INSERT INTO music.Albums_songwriters VALUES ('AC/DC', 'The razors s edge');
INSERT INTO music.Albums_songwriters VALUES ('AC/DC', 'Back in Black');
INSERT INTO music.Albums_songwriters VALUES ('Pink Floyd', 'The Dark Side of the Moon');
INSERT INTO music.Albums_songwriters VALUES ('Pink Floyd', 'Wish you were here');

SELECT * FROM music.Albums_songwriters;
DELETE FROM music.Albums_songwriters;

-- Songs_songwriters
INSERT INTO music.Songs_songwriters VALUES ('Stairway to Heaven', 'Led Zeppelin');
INSERT INTO music.Songs_songwriters VALUES ('Wind of change', 'Scorpions');
INSERT INTO music.Songs_songwriters VALUES ('Shine on you Crazy Diamond', 'Pink Floyd');
INSERT INTO music.Songs_songwriters VALUES ('Поворот', 'Машина времени');
INSERT INTO music.Songs_songwriters VALUES ('Du hast', 'Rammstein');
INSERT INTO music.Songs_songwriters VALUES ('Bohemian rhapsody', 'Queen');
INSERT INTO music.Songs_songwriters VALUES ('Thunderstruck', 'AC/DC');
INSERT INTO music.Songs_songwriters VALUES ('Crazy', 'Aerosmith');
INSERT INTO music.Songs_songwriters VALUES ('Breathe', 'Pink FLoyd');
INSERT INTO music.Songs_songwriters VALUES ('За тех, кто в море', 'Машина времени');
INSERT INTO music.Songs_songwriters VALUES ('Paranoid', 'Black Sabbath');
INSERT INTO music.Songs_songwriters VALUES ('Black Sabbath', 'Black Sabbath');
INSERT INTO music.Songs_songwriters VALUES ('November rain', 'Guns n roses');
INSERT INTO music.Songs_songwriters VALUES ('Иероглиф', 'Пикник');
INSERT INTO music.Songs_songwriters VALUES ('Фиолетово-чёрный', 'Пикник');
INSERT INTO music.Songs_songwriters VALUES ('Таня', 'Крематорий');
INSERT INTO music.Songs_songwriters VALUES ('Мусорный ветер', 'Крематорий');
INSERT INTO music.Songs_songwriters VALUES ('Sonne', 'Rammstein');
INSERT INTO music.Songs_songwriters VALUES ('Sweet emotion', 'Aerosmith');
INSERT INTO music.Songs_songwriters VALUES ('Back in Black', 'AC/DC');
INSERT INTO music.Songs_songwriters VALUES ('Sweet child o Mine', 'Guns n roses');
INSERT INTO music.Songs_songwriters VALUES ('Welcome to the Jungle', 'Guns n roses');
INSERT INTO music.Songs_songwriters VALUES ('Come as you are', 'Nirvana');
INSERT INTO music.Songs_songwriters VALUES ('Lithium', 'Nirvana');
INSERT INTO music.Songs_songwriters VALUES ('Smells like teen spirit', 'Nirvana');
INSERT INTO music.Songs_songwriters VALUES ('Send me an angel', 'Scorpions');
INSERT INTO music.Songs_songwriters VALUES ('Whole lotta love', 'Led Zeppelin');
INSERT INTO music.Songs_songwriters VALUES ('Kashmir', 'Led Zeppelin');
INSERT INTO music.Songs_songwriters VALUES ('Show must go on', 'Queen');

SELECT * FROM music.Songs_songwriters;
DELETE FROM music.Songs_songwriters;

