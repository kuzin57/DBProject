package execute

import (
	"database/sql"
	"errors"
	"fmt"
	"os"
	"strings"
)

var (
	errNoSuchFile   = errors.New("can not find file")
	errReadingFile  = errors.New("can not read file")
	errInvalidQuery = errors.New("error while executing query")
)

type queriesFiles []string

func NewQueries(files ...string) queriesFiles {
	qf := queriesFiles(make([]string, len(files)))
	copy(qf, files)
	return qf
}

func (qf queriesFiles) ExecuteQueries(db *sql.DB) error {
	for _, file := range qf {
		if err := executeQueriesFromFile(file, db); err != nil {
			return err
		}
	}
	return nil
}

func executeQueriesFromFile(file string, db *sql.DB) error {
	queries, err := os.Open(file)
	if err != nil {
		return errNoSuchFile
	}

	content := make([]byte, 1000000)
	bytesRead, err := queries.Read(content)
	if err != nil {
		return errReadingFile
	}

	parsedQueries := strings.Split(string(content[:bytesRead]), "---")
	for _, query := range parsedQueries {
		_, err = db.Exec(query)
		if err != nil {
			return fmt.Errorf("%s: %s\nquery: %s", errInvalidQuery, err, query)
		}
	}

	return nil
}
