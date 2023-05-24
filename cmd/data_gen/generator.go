package datagen

import (
	"math/rand"
	"strconv"
	"strings"
	"time"
)

type Users []*User
type Playlists []*Playlist
type Countries []*Country

type User struct {
	UserID     string
	Password   string
	Firstname  string
	Surname    string
	Country    string
	Register   string
	Birthdate  string
	Privileged bool
	Playlists  uint16
	Email      string
}

type Playlist struct {
	Name        string
	Songs       []string
	Created     string
	CreatorID   string
	SongsNumber uint16
}

type Country struct {
	Name        string
	Users       int
	SongWriters int
}

func genString(length int) string {
	var result string
	for i := 0; i < length; i++ {
		result += string(symbols[rand.Intn(len(symbols))])
	}
	return result
}

func genRandomDate(minDate, maxDate int64) string {
	delta := maxDate - minDate

	sec := rand.Int63n(delta) + minDate
	return formatDate(time.Unix(sec, 0))
}

func addLeadingZeroIfNeed(number string) string {
	if len(number) == 2 {
		return number
	}
	return "0" + number
}

func formatDate(date time.Time) string {
	return strconv.Itoa(date.Year()) + "-" +
		addLeadingZeroIfNeed(strconv.Itoa(int(date.Month()))) + "-" +
		addLeadingZeroIfNeed(strconv.Itoa(date.Day()))
}

func GenUsers(amount int) Users {
	rand.Seed(time.Now().UnixNano())
	var users Users

	for i := 0; i < amount; i++ {
		country := countries[rand.Intn(len(countries))]
		uniqueNumber := strconv.Itoa(rand.Intn(bigConst))

		newUser := &User{
			UserID:     genString(userIDLength),
			Password:   genString(passwordLength),
			Country:    country,
			Firstname:  names[country][rand.Intn(len(names[country]))],
			Surname:    surnames[country][rand.Intn(len(surnames[country]))],
			Privileged: (i%13 == 0),
			Playlists:  uint16(rand.Intn(5)),
			Birthdate:  genRandomDate(minBirthdate, maxBirthdate),
			Register:   genRandomDate(minRegisterDate, maxRegisterDate),
		}

		newUser.Email = strings.ToLower(newUser.Firstname) +
			"." + strings.ToLower(newUser.Surname) +
			uniqueNumber + "@" + emails[rand.Intn(len(emails))]

		users = append(users, newUser)
	}

	return users
}

func parseTime(timeString string) (time.Time, error) {
	ymd := strings.Split(timeString, "-")
	year, err := strconv.Atoi(ymd[0])
	if err != nil {
		return time.Time{}, err
	}

	m, err := strconv.Atoi(ymd[1])
	if err != nil {
		return time.Time{}, err
	}
	month := time.Month(m)

	day, err := strconv.Atoi(ymd[2])
	if err != nil {
		return time.Time{}, err
	}

	return time.Date(year, month, day, 0, 0, 0, 0, time.Now().Location()), nil
}

func GenPlaylistsByUsers(users Users) Playlists {
	rand.Seed(time.Now().UnixNano())
	var playlists Playlists

	for _, user := range users {
		for j := 0; j < int(user.Playlists); j++ {
			registered, err := parseTime(user.Register)
			if err != nil {
				panic(err)
			}

			newPlaylist := &Playlist{
				CreatorID:   user.UserID,
				Created:     genRandomDate(registered.Unix(), time.Now().Unix()),
				SongsNumber: uint16(rand.Intn(4)),
				Name:        "Playlist_" + user.UserID + "_" + strconv.Itoa(j),
			}

			for k := 0; k < int(newPlaylist.SongsNumber); k++ {
				newPlaylist.Songs = append(
					newPlaylist.Songs,
					songs[rand.Intn(len(songs))])
			}

			playlists = append(playlists, newPlaylist)
		}
	}
	return playlists
}

func GenCountries(users Users) Countries {
	usersFromCountries := make(map[string]int)
	usersFromCountries["France"] = 0

	for _, user := range users {
		if _, ok := usersFromCountries[user.Country]; !ok {
			usersFromCountries[user.Country] = 1
		} else {
			usersFromCountries[user.Country]++
		}
	}

	for country, usersNumber := range countriesUsers {
		usersFromCountries[country] += usersNumber
	}

	var countries Countries
	for country, usersNumber := range usersFromCountries {
		countries = append(countries, &Country{
			Name:        country,
			Users:       usersNumber,
			SongWriters: len(countriesSongwriters[country]),
		})
	}

	return countries
}
