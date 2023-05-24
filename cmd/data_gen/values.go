package datagen

import "time"

var (
	symbols        = []rune("qwertyuiopasdfghjklzxcvbnm;/.,!@^&")
	userIDLength   = 10
	passwordLength = 15
	countries      = []string{
		"Russia",
		"Belarus",
		"Ukraine",
		"USA",
		"England",
		"Germany",
		"Spain",
		"China",
		"Japan",
		"Brazil",
	}

	surnames = map[string][]string{
		"Russia": {
			"Ivanov", "Dmitriev", "Andreev", "Alekseev", "Sergeev", "Romanov", "Nickolaev",
		},
		"Belarus": {
			"Petrov", "Kovalyov", "Kotov", "Novikov", "Lysenko", "Azarenko",
		},
		"Ukraine": {
			"Abramchuk", "Malinovskiy", "Sidorchuk", "Sidorenko", "Yarmolenko",
		},
		"USA": {
			"Doe", "Edisson", "Johnson", "McFly", "Brown",
		},
		"England": {
			"Doe", "Edisson", "Johnson", "McFly", "Brown",
		},
		"Germany": {
			"Nilsen", "Shurrle", "Gotze", "Muller", "Goretzka",
		},
		"Spain": {
			"Alba", "Ramos", "Marquina", "Fonoloza", "Asensio",
		},
		"China": {
			"Lyu", "Chen", "Yan", "Chzhao",
		},
		"Japan": {
			"Nagatomo", "Uzumaki", "Sato", "Sudzuki", "Ito",
		},
		"Brazil": {
			"Oliveira", "Souza", "Lima", "Costa", "Ferreyra",
		},
	}

	names = map[string][]string{
		"Russia": {
			"Ivan", "Dmitriy", "Andrey", "Aleksey", "Sergei", "Roman", "Nickolay",
		},
		"Belarus": {
			"Ivan", "Dmitriy", "Andrey", "Aleksey", "Sergei", "Roman", "Nickolay",
		},
		"Ukraine": {
			"Mykola", "Sergiy", "Yuri", "Andriy", "Oleksandr", "Oleksiy",
		},
		"USA": {
			"John", "Mike", "Max", "Chris", "Andrew", "Jack", "Ralph",
		},
		"England": {
			"John", "Mike", "Max", "Chris", "Andrew", "Jack", "Ralph",
		},
		"Germany": {
			"Peter", "Nils", "Thomas", "Mario", "Andre", "Manuel", "Leon",
		},
		"Spain": {
			"Andres", "Marco", "Sergio", "Mario", "Marcos", "Jordi", "Joseph",
		},
		"China": {
			"Li", "Si", "Mao", "Bai", "Yi", "Tu", "Fa", "Kiu",
		},
		"Japan": {
			"Yuto", "Sota", "Riku", "Yiuito", "Haruto",
		},
		"Brazil": {
			"Joao", "Andre", "Givanildu", "Naldo", "Roberto", "Lucas",
		},
	}

	emails = []string{
		"gmail.com",
		"yahoo.com",
		"mail.ru",
		"yandex.ru",
	}

	bigConst = 100000

	minBirthdate = time.Date(1970, 1, 0, 0, 0, 0, 0, time.UTC).Unix()
	maxBirthdate = time.Date(2010, 1, 0, 0, 0, 0, 0, time.UTC).Unix()

	minRegisterDate = time.Date(2014, 1, 0, 0, 0, 0, 0, time.UTC).Unix()
	maxRegisterDate = time.Date(2022, 1, 0, 0, 0, 0, 0, time.UTC).Unix()

	songs = []string{
		"Send me an angel",
		"Wind of change",
		"Back in Black",
		"Stairway to Heaven",
		"Kashmir",
		"Sweet emotion",
		"Sonne",
		"Back in Black",
		"Thunderstruck",
		"Crazy",
		"Lithium",
		"Du hast",
		"Bohemian rhapsody",
		"Show must go on",
		"Thunderstruck",
		"Shine on you Crazy Diamond",
		"Breathe",
		"Smells like teen spirit",
	}

	countriesSongwriters = map[string][]string{
		"England":   {"Led Zeppelin", "Black Sabbath", "Queen", "Pink Floyd"},
		"USA":       {"Aerosmith", "Guns n roses", "Nirvana"},
		"Germany":   {"Rammstein", "Scorpions"},
		"Russia":    {"Машина Времени", "Пикник", "Крематорий"},
		"Australia": {"AC/DC"},
	}

	countriesUsers = map[string]int{
		"England": 2,
		"USA":     4,
		"Spain":   1,
		"Germany": 1,
		"Romania": 1,
		"Belarus": 1,
		"China":   1,
		"France":  1,
		"Denmark": 1,
		"Sweden":  1,
	}
)
