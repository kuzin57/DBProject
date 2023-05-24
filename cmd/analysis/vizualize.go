package analysis

import (
	"database/sql"

	"gonum.org/v1/plot"
	"gonum.org/v1/plot/plotter"
	"gonum.org/v1/plot/vg"
)

func buildHistogram(values plotter.Values, title, outputFile string) error {
	p := plot.New()
	p.Title.Text = title
	hist, err := plotter.NewHist(values, 20)
	if err != nil {
		return err
	}

	p.Add(hist)

	if err := p.Save(
		10*vg.Inch,
		10*vg.Inch,
		outputFile,
	); err != nil {
		return err
	}

	return nil
}

func vizualizeDates(db *sql.DB) error {
	registered, born, err := getUsersDates(db)
	if err != nil {
		return err
	}

	var valuesRegistered, valuesBorn plotter.Values
	for i := 0; i < len(registered); i++ {
		valuesRegistered = append(valuesRegistered, float64(registered[i]))
		valuesBorn = append(valuesBorn, float64(born[i]))
	}

	if err = buildHistogram(
		valuesRegistered,
		"years of registration",
		"./analysis/images/registration_years.png",
	); err != nil {
		return err
	}

	if err = buildHistogram(
		valuesBorn,
		"birth years",
		"./analysis/images/birth_years.png",
	); err != nil {
		return err
	}
	return nil
}

func Vizualize(db *sql.DB) error {
	if err := vizualizeDates(db); err != nil {
		return err
	}
	return nil
}
