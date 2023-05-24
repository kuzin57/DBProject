package queries_test

import (
	"database/sql"
	"fmt"
	"testing"

	"github.com/lib/pq"
	"github.com/stretchr/testify/suite"
	"gitlab.atp-fivt.org/db2023/kuzinro-project/tests/execute"
	db_setup "gitlab.atp-fivt.org/db2023/kuzinro-project/tests/test/db"
)

const (
	ddlScripts        = "../queries/ddl.txt"
	insertsFile       = "../queries/inserts.txt"
	fileWithFunctions = "../queries/functions.txt"
	buildViewsFile    = "../queries/build_views_queries.txt"
)

type FunctionsTestSuite struct {
	suite.Suite

	db *sql.DB
}

func (suite *FunctionsTestSuite) SetupTest() {
	var err error
	if suite.db, err = db_setup.SetupConnection(); err != nil {
		suite.Fail(err.Error())
	}

	queryFiles := execute.NewQueries(ddlScripts, insertsFile, buildViewsFile, fileWithFunctions)
	queryFiles.ExecuteQueries(suite.db)
}

func RunTest[T int | string](
	suite *FunctionsTestSuite,
	funcName string,
	testCases []string,
	expected []T,
) {
	for i, testCase := range testCases {
		var actual T
		rows, err := suite.db.Query(fmt.Sprintf("SELECT %s('%s');", funcName, testCase))
		if err != nil {
			suite.Fail(err.Error())
		}

		if rows.Next() {
			rows.Scan(&actual)
			suite.Assert().Equal(expected[i], actual, "Wrong number of likes")
		} else {
			suite.Fail("Zero rows in the result of the query")
		}

		rows.Close()
	}
}

func RunTestWithError(
	suite *FunctionsTestSuite,
	funcName string,
	testCases []string,
	requiredError error,
) {
	for _, testCase := range testCases {
		_, err := suite.db.Query(fmt.Sprintf("SELECT %s('%s');", funcName, testCase))
		suite.Require().Error(err)
		suite.Require().Equal(err.Error(), requiredError.Error(), "Invalid name of error")
	}
}

func (suite *FunctionsTestSuite) TestCountLikesFunction() {
	users := []string{
		"gH321",
		"wX2C3",
		"gJJ8Y",
		"6TtIO",
		"5FbN1",
	}
	expected := []int{1, 2, 1, 2, 0}

	RunTest(suite, "total_likes", users, expected)
}

func (suite *FunctionsTestSuite) TestGetSongwriter() {
	songs := []string{
		"Stairway to Heaven",
		"Paranoid",
		"За тех, кто в море",
		"Du hast",
		"Welcome to the Jungle",
	}
	expected := []string{
		"Led Zeppelin",
		"Black Sabbath",
		"Машина времени",
		"Rammstein",
		"Guns n roses",
	}

	RunTest(suite, "get_songwriter", songs, expected)
}

func (suite *FunctionsTestSuite) TestWrongSongs() {
	songs := []string{
		"Blabla",
		"hmhmhmhm",
		"ыыыыыыыы",
		"yayayayaya",
	}

	errNoSuchSong := &pq.Error{Message: "No such song"}
	RunTestWithError(suite, "get_songwriter", songs, errNoSuchSong)
}

func TestFunctionsTestSuite(t *testing.T) {
	suite.Run(t, new(FunctionsTestSuite))
}
