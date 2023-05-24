package queries_test

import (
	"database/sql"
	"os"
	"strings"
	"testing"

	_ "github.com/lib/pq"
	"github.com/stretchr/testify/suite"
	"gitlab.atp-fivt.org/db2023/kuzinro-project/tests/execute"
	db_setup "gitlab.atp-fivt.org/db2023/kuzinro-project/tests/test/db"
)

const (
	fileWithQueries = "../queries/smart_queries.txt"
)

type QueriesTestSuite struct {
	suite.Suite
	db      *sql.DB
	queries []string
}

func (suite *QueriesTestSuite) SetupTest() {
	var err error
	if suite.db, err = db_setup.SetupConnection(); err != nil {
		suite.Fail(err.Error())
	}

	file, err := os.Open(fileWithQueries)
	if err != nil {
		suite.Fail("Can not open file with queries", err)
	}

	content := make([]byte, 1000000)
	bytesRead, err := file.Read(content)
	if err != nil {
		suite.Fail("Can not read from file with queries", err)
	}

	queries := strings.Split(string(content[:bytesRead]), "---")
	suite.queries = make([]string, len(queries))
	copy(suite.queries, queries)

	queryFiles := execute.NewQueries(ddlScripts, insertsFile, buildViewsFile, fileWithFunctions)
	queryFiles.ExecuteQueries(suite.db)
}

func (suite *QueriesTestSuite) TestFirstQuery() {
	rows, err := suite.db.Query(suite.queries[0])
	if err != nil {
		suite.Fail("Invalid query", err)
	}
	defer rows.Close()

	var (
		band      string
		genresCnt int
	)
	band_genres := make(map[string]int)
	for rows.Next() {
		rows.Scan(&band, &genresCnt)
		band_genres[band] = genresCnt
	}

	bands := []string{
		"Nirvana", "Led Zeppelin", "Pink Floyd", "Scorpions", "Black Sabbath",
		"Крематорий", "Пикник", "Машина времени", "Rammstein", "Aerosmith", "Queen",
		"Guns n roses", "AC/DC",
	}

	for _, band := range bands {
		_, ok := band_genres[band]
		suite.Require().True(ok)
	}

	suite.Require().Equal(3, band_genres["Nirvana"])
	suite.Require().Equal(3, band_genres["Led Zeppelin"])
	suite.Require().Equal(1, band_genres["Pink Floyd"])
	suite.Require().Equal(2, band_genres["Scorpions"])
	suite.Require().Equal(2, band_genres["Black Sabbath"])
	suite.Require().Equal(2, band_genres["Крематорий"])
	suite.Require().Equal(2, band_genres["Пикник"])
	suite.Require().Equal(2, band_genres["Машина времени"])
	suite.Require().Equal(2, band_genres["Rammstein"])
	suite.Require().Equal(2, band_genres["Aerosmith"])
	suite.Require().Equal(2, band_genres["Queen"])
	suite.Require().Equal(3, band_genres["Guns n roses"])
	suite.Require().Equal(2, band_genres["AC/DC"])
}

func (suite *QueriesTestSuite) TestSecondQuery() {
	rows, err := suite.db.Query(suite.queries[1])
	if err != nil {
		suite.Fail("Invalid query", err)
	}
	defer rows.Close()

	var (
		country   string
		avgRating float64
		bandsCnt  int
	)

	country_rating := make(map[string]float64)
	country_bands := make(map[string]int)
	for rows.Next() {
		rows.Scan(&country, &avgRating, &bandsCnt)
		country_rating[country] = avgRating
		country_bands[country] = bandsCnt
	}

	countries := []string{
		"Australia", "England", "Russia", "USA", "Germany",
	}

	for _, country := range countries {
		_, ok := country_rating[country]
		suite.Require().True(ok)
	}

	suite.Require().Equal(10.0, country_rating["Australia"])
	suite.Require().Equal(9.825, country_rating["England"])
	suite.Require().Equal((10.0+9.8+9.5)/3, country_rating["Russia"])
	suite.Require().Equal((10.0+9.5+9.5)/3, country_rating["USA"])
	suite.Require().Equal(9.15, country_rating["Germany"])

	suite.Require().Equal(1, country_bands["Australia"])
	suite.Require().Equal(4, country_bands["England"])
	suite.Require().Equal(3, country_bands["Russia"])
	suite.Require().Equal(3, country_bands["USA"])
	suite.Require().Equal(2, country_bands["Germany"])
}

func (suite *QueriesTestSuite) TestThirdQuery() {
	rows, err := suite.db.Query(suite.queries[2])
	if err != nil {
		suite.Fail("Invalid query", err)
	}
	defer rows.Close()

	var (
		likesCnt int
		band     string
	)

	bands_likes := make(map[string]int)
	for rows.Next() {
		rows.Scan(&band, &likesCnt)
		bands_likes[band] = likesCnt
	}

	bands := []string{
		"Nirvana", "Led Zeppelin", "Pink Floyd", "Scorpions", "Black Sabbath",
		"Крематорий", "Пикник", "Машина времени", "Rammstein", "Aerosmith", "Queen",
		"Guns n roses", "AC/DC",
	}

	notZeroLikes := make(map[string]struct{})
	notZeroLikes["Nirvana"] = struct{}{}
	notZeroLikes["AC/DC"] = struct{}{}
	notZeroLikes["Pink Floyd"] = struct{}{}
	notZeroLikes["Машина времени"] = struct{}{}
	notZeroLikes["Guns n roses"] = struct{}{}

	for _, band := range bands {
		_, ok := bands_likes[band]
		suite.Require().True(ok)

		_, ok = notZeroLikes[band]
		if ok {
			continue
		}

		suite.Require().Equal(0, bands_likes[band])
	}

	suite.Require().Equal(3, bands_likes["Nirvana"])
	suite.Require().Equal(4, bands_likes["AC/DC"])
	suite.Require().Equal(2, bands_likes["Pink Floyd"])
	suite.Require().Equal(1, bands_likes["Машина времени"])
	suite.Require().Equal(1, bands_likes["Guns n roses"])
}

func (suite *QueriesTestSuite) TestFourthQuery() {
	rows, err := suite.db.Query(suite.queries[3])
	if err != nil {
		suite.Fail("Invalid query", err)
	}
	defer rows.Close()

	var (
		userID   string
		likesCnt int
	)

	users_likes := make(map[string]int)
	for rows.Next() {
		rows.Scan(&userID, &likesCnt)
		users_likes[userID] = likesCnt
	}

	_, ok := users_likes["wX2C3"]
	suite.Require().True(ok)

	_, ok = users_likes["6TtIO"]
	suite.Require().True(ok)

	suite.Require().Equal(2, users_likes["wX2C3"])
	suite.Require().Equal(2, users_likes["6TtIO"])
}

func (suite *QueriesTestSuite) TestFifthQuery() {
	rows, err := suite.db.Query(suite.queries[4])
	if err != nil {
		suite.Fail("Invalid query", err)
	}
	defer rows.Close()

	var (
		likesCnt int
		playlist string
	)

	playlists_likes := make(map[string]int)
	for rows.Next() {
		rows.Scan(&playlist, &likesCnt)
		playlists_likes[playlist] = likesCnt
	}

	playlists := []string{
		"Playlist for running", "Rock", "For bad mood",
		"My favourite songs", "Playlist",
	}

	for _, playlist := range playlists {
		_, ok := playlists_likes[playlist]
		suite.Require().True(ok)
	}

	suite.Require().Equal(4, playlists_likes["Playlist for running"])
	suite.Require().Equal(3, playlists_likes["Rock"])
	suite.Require().Equal(3, playlists_likes["For bad mood"])
	suite.Require().Equal(3, playlists_likes["My favourite songs"])
	suite.Require().Equal(2, playlists_likes["Playlist"])
}

func (suite *QueriesTestSuite) TestSixthQuery() {
	rows, err := suite.db.Query(suite.queries[5])
	if err != nil {
		suite.Fail("Invalid query", err)
	}
	defer rows.Close()

	var (
		band  string
		album string
		date  string
	)

	var counter int
	albums := make(map[string]struct{})
	for rows.Next() {
		rows.Scan(&band, &album, &date)
		albums[album] = struct{}{}
		counter++
	}

	albumsAfter1980 := []string{
		"Back in Black", "Винные мемуары", "Иероглиф", "В добрый час",
		"Appetite for Destruction", "Десять лет спустя", "Crazy world",
		"Innuendo", "Nevermind", "Get a Grip", "Sehnsucht", "Египтянин", "Sonne",
	}

	suite.Require().Equal(13, counter)
	suite.Require().Equal(len(albumsAfter1980), len(albums))
	for _, album := range albumsAfter1980 {
		_, ok := albums[album]
		suite.Require().True(ok)
	}
}

func TestQueriesTestSuite(t *testing.T) {
	suite.Run(t, new(QueriesTestSuite))
}
