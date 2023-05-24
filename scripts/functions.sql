-- Function counts the number of user's likes
-- user id passes to arguments list
CREATE FUNCTION total_likes(required_user_id VARCHAR(50)) RETURNS integer AS $$
<<outerblock>>
DECLARE
    likes integer := 0;
BEGIN
    SELECT count INTO likes
    FROM (
        SELECT COUNT(*) AS count
        FROM music.Likes
        GROUP BY user_id
        HAVING user_id = required_user_id
    ) AS subquery;

    RETURN likes;
END;
$$ LANGUAGE plpgsql;

SELECT total_likes('gH321');

-- Useful function to find the artist by the song
CREATE OR REPLACE FUNCTION get_songwriter(song VARCHAR(200))
    RETURNS VARCHAR(100) AS $$
<<outerblock>>
DECLARE
    band VARCHAR(100) := '';
BEGIN
    SELECT songwriter INTO band
    FROM music.Songs_songwriters
    WHERE song_name = song;

    IF band IS NULL THEN 
        RAISE EXCEPTION 'No such song';
    END IF;

    RETURN band;
END;
$$ LANGUAGE plpgsql;

SELECT get_songwriter('Back in Bladfgck');