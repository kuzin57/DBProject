package analysis

import (
	"database/sql"
	"strconv"
)

func getUsersDates(db *sql.DB) ([]int, []int, error) {
	sqlQuery := "SELECT register, birthdate FROM music.Users;"
	rows, err := db.Query(sqlQuery)
	if err != nil {
		return nil, nil, err
	}

	var (
		registered, birthdate string
		registeredYears       []int
		bornYears             []int
	)

	for rows.Next() {
		rows.Scan(&registered, &birthdate)

		registeredYear, err := strconv.Atoi(registered[:4])
		if err != nil {
			return nil, nil, err
		}

		bornYear, err := strconv.Atoi(birthdate[:4])
		if err != nil {
			return nil, nil, err
		}

		registeredYears = append(registeredYears, registeredYear)
		bornYears = append(bornYears, bornYear)

	}

	return registeredYears, bornYears, nil
}
