package main

import (
	"database/sql"
	"errors"
	"fmt"
	"os"
	"strconv"

	_ "github.com/lib/pq"
	"gitlab.atp-fivt.org/db2023/kuzinro-project/cmd/analysis"
	datagen "gitlab.atp-fivt.org/db2023/kuzinro-project/cmd/data_gen"
	"gitlab.atp-fivt.org/db2023/kuzinro-project/tests/execute"
)

const (
	DDLScriptsCode      = "../tests/queries/ddl.txt"
	InsertsScriptsCode  = "../tests/queries/inserts.txt"
	ViewsScriptsCode    = "../tests/queries/build_views_queries.txt"
	TriggersScriptsCode = "../tests/queries/build_triggers.txt"
)

var (
	errDBUnavailable = errors.New("database can not be assessed")
	errUnknownType   = errors.New("unknown type")
)

func initDB(db *sql.DB) error {
	if err := db.Ping(); err != nil {
		return errDBUnavailable
	}

	filesWithQueries := execute.NewQueries(
		DDLScriptsCode,
		InsertsScriptsCode,
		ViewsScriptsCode,
		TriggersScriptsCode,
	)

	if err := filesWithQueries.ExecuteQueries(db); err != nil {
		return err
	}

	return nil
}

func makeInserts[T datagen.User | datagen.Country | datagen.Playlist](
	db *sql.DB,
	array []*T,
) error {
	for _, elem := range array {
		var sqlQuery string

		switch v := any(elem).(type) {
		case *datagen.User:
			privileged := "FALSE"
			if v.Privileged {
				privileged = "TRUE"
			}

			sqlQuery = fmt.Sprintf(`
				INSERT INTO music.Users(user_id, password, firstname,
					surname, country, register, birthdate, privileged, playlists, email)
				VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', %s, %d, '%s')`,
				v.UserID, v.Password, v.Firstname, v.Surname,
				v.Country, v.Register, v.Birthdate, privileged,
				v.Playlists, v.Email,
			)

		case *datagen.Playlist:
			sqlQuery = fmt.Sprintf(`
				INSERT INTO music.Playlists(name, created, creator_id, songs)
				VALUES ('%s', '%s', '%s', %d)`,
				v.Name, v.Created, v.CreatorID, 0,
			)

		case *datagen.Country:
			sqlQuery = fmt.Sprintf(`
			INSERT INTO music.Countries(name, users, songwriters)
			VALUES ('%s', %d, %d)`,
				v.Name, v.Users, v.SongWriters,
			)

		default:
			return errUnknownType
		}

		rows, err := db.Query(sqlQuery)
		if err != nil {
			return err
		}

		rows.Close()
	}

	return nil
}

func fillTables(db *sql.DB) error {
	if err := db.Ping(); err != nil {
		return errDBUnavailable
	}

	users := datagen.GenUsers(10000)
	if err := makeInserts(db, users); err != nil {
		return err
	}

	playlists := datagen.GenPlaylistsByUsers(users)
	if err := makeInserts(db, playlists); err != nil {
		return err
	}

	countries := datagen.GenCountries(users)
	if err := makeInserts(db, countries); err != nil {
		return err
	}

	for _, playlist := range playlists {
		for _, song := range playlist.Songs {
			sqlQuery := fmt.Sprintf(`
				INSERT INTO music.Playlists_songs(song_name, playlist)
				VALUES ('%s', '%s')`,
				song, playlist.Name,
			)

			rows, err := db.Query(sqlQuery)
			if err != nil {
				return err
			}

			rows.Close()
		}
	}

	return nil
}

func main() {
	host := os.Getenv("ENV_HOST")
	port, err := strconv.Atoi(os.Getenv("ENV_PORT"))
	if err != nil {
		panic(err)
	}

	user := os.Getenv("ENV_USER")
	password := os.Getenv("ENV_PASSWORD")
	dbname := os.Getenv("ENV_DBNAME")

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	defer db.Close()

	if err = initDB(db); err != nil {
		panic(err)
	}

	if err = fillTables(db); err != nil {
		panic(err)
	}

	if err = analysis.Vizualize(db); err != nil {
		panic(err)
	}
}
