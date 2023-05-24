package queries_test

import (
	"database/sql"
	"testing"

	"github.com/stretchr/testify/suite"
	"gitlab.atp-fivt.org/db2023/kuzinro-project/tests/execute"
	db_setup "gitlab.atp-fivt.org/db2023/kuzinro-project/tests/test/db"
)

const (
	userIDlength          = 5
	rowsNumberInLikesView = 9
)

type ViewsTestSuite struct {
	suite.Suite

	db      *sql.DB
	queries []string
}

func (suite *ViewsTestSuite) SetupTest() {
	var err error
	if suite.db, err = db_setup.SetupConnection(); err != nil {
		suite.Fail(err.Error())
	}

	queryFiles := execute.NewQueries(ddlScripts, insertsFile, buildViewsFile, fileWithFunctions)
	queryFiles.ExecuteQueries(suite.db)

	suite.queries = []string{
		"SELECT * FROM music.User_view;",
		"SELECT * FROM music.Likes_view;",
	}
}

func (suite *ViewsTestSuite) TestUserView() {
	rows, err := suite.db.Query(suite.queries[0])
	if err != nil {
		suite.Fail(err.Error())
	}

	var (
		hiddenUserID string
		country      string
		register     string
		playlists    int
	)
	for rows.Next() {
		rows.Scan(
			&hiddenUserID,
			&country,
			&register,
			&playlists,
		)

		suite.Require().NotEmpty(hiddenUserID, "Empty user ID")
		suite.Require().NotEmpty(country, "Empty country")
		suite.Require().NotEmpty(register, "Empty register date")
		suite.Require().Contains(hiddenUserID, "***")
		suite.Require().Equal(len(hiddenUserID), userIDlength)
	}
}

func (suite *ViewsTestSuite) TestLikesView() {
	rows, err := suite.db.Query(suite.queries[1])
	if err != nil {
		suite.Fail(err.Error())
	}

	var (
		hiddenUserID string
		songName     string
		date         string
		rowsCnt      int
	)
	for rows.Next() {
		rows.Scan(
			&hiddenUserID,
			&songName,
			&date,
		)

		suite.Require().NotEmpty(hiddenUserID, "Empty user ID")
		suite.Require().NotEmpty(songName, "Empty song name")
		suite.Require().NotEmpty(date, "Empty date")
		suite.Require().Contains(hiddenUserID, "***")
		suite.Require().Equal(len(hiddenUserID), userIDlength)
		rowsCnt++
	}

	suite.Require().Equal(rowsNumberInLikesView, rowsCnt)
}

func (suite *ViewsTestSuite) TestSimilarOutput() {
	firstQueries, err := getQueries(withoutViewsQueriesFile)
	if err != nil {
		suite.Fail("Could not read first (without views) queries")
	}

	secondQueries, err := getQueries(viewsQueriesFile)
	if err != nil {
		suite.Fail("Could not read second (views) queries")
	}

	db, err := db_setup.SetupConnection()
	if err != nil {
		suite.Fail("Could not connect to database")
	}

	columnsNumber := []int{3, 3, 2, 3}

	for i := range firstQueries {
		firstRows, err := db.Query(firstQueries[i])
		if err != nil {
			suite.Fail("Invalid query")
		}

		secondRows, err := db.Query(secondQueries[i])
		if err != nil {
			suite.Fail("Invalid query")
		}

		suite.checkSimilarRows(firstRows, secondRows, columnsNumber[i])
	}
}

func TestViewsTestSuite(t *testing.T) {
	suite.Run(t, new(ViewsTestSuite))
}

func (suite *ViewsTestSuite) checkSimilarRows(firstRows, secondRows *sql.Rows, columns int) {
	columnsFirstPtrs := make([]any, columns)
	columnsSecondPtrs := make([]any, columns)
	columnsFirst := make([]string, columns)
	columnsSecond := make([]string, columns)

	for i := range columnsFirst {
		columnsFirstPtrs[i] = &columnsFirst[i]
		columnsSecondPtrs[i] = &columnsSecond[i]
	}

	for {
		hasNextRowFirst := firstRows.Next()
		hasNextRowSecond := secondRows.Next()

		if !hasNextRowFirst && !hasNextRowSecond {
			break
		}

		if !(hasNextRowFirst && hasNextRowSecond) {
			suite.Fail("Different number of rows")
		}

		firstRows.Scan(
			columnsFirstPtrs...,
		)

		secondRows.Scan(
			columnsSecondPtrs...,
		)

		for i := range columnsFirst {
			suite.Require().Equal(columnsFirst[i], columnsSecond[i])
		}
	}
}
