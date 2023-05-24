package queries_test

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"gitlab.atp-fivt.org/db2023/kuzinro-project/tests/execute"
	db_setup "gitlab.atp-fivt.org/db2023/kuzinro-project/tests/test/db"
)

const (
	withoutViewsQueriesFile = "../queries/views_queries.txt"
	viewsQueriesFile        = "../queries/without_views_queries.txt"
)

func getQueries(fileName string) ([]string, error) {
	file, err := os.Open(fileName)
	if err != nil {
		return nil, err
	}

	content := make([]byte, 100000)
	bytesRead, err := file.Read(content)
	if err != nil {
		return nil, err
	}

	content = content[:bytesRead]
	return strings.Split(string(content), "---"), nil
}

func BenchmarkQueries(b *testing.B) {
	slowQueries, err := getQueries(withoutViewsQueriesFile)
	if err != nil {
		b.FailNow()
	}

	fastQueries, err := getQueries(viewsQueriesFile)
	if err != nil {
		b.FailNow()
	}

	db, err := db_setup.SetupConnection()
	if err != nil {
		b.FailNow()
	}

	queryFiles := execute.NewQueries(ddlScripts, insertsFile, buildViewsFile, fileWithFunctions)
	queryFiles.ExecuteQueries(db)

	for i, query := range slowQueries {
		b.Run(fmt.Sprintf("Running 'without view' query #%d", i+1), func(b *testing.B) {
			db.Query(query)
		})
	}

	for i, query := range fastQueries {
		b.Run(fmt.Sprintf("Running view query #%d", i+1), func(b *testing.B) {
			db.Query(query)
		})
	}
}
