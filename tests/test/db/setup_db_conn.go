package db_setup

import (
	"database/sql"
	"fmt"
	"os"
	"strconv"
)

func SetupConnection() (*sql.DB, error) {
	host := os.Getenv("ENV_HOST")
	port, err := strconv.Atoi(os.Getenv("ENV_PORT"))
	if err != nil {
		return nil, fmt.Errorf("invalid format of env ENV_PORT: %s", err.Error())
	}

	user := os.Getenv("ENV_USER")
	password := os.Getenv("ENV_PASSWORD")
	dbname := os.Getenv("ENV_DBNAME")

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		return nil, fmt.Errorf("can not open database connection: %s", err.Error())
	}

	return db, nil
}
