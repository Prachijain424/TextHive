package main

import (
	"github.com/go-pg/pg/orm"
	"log"
	"os"

	"github.com/go-pg/pg"
)

var Db *pg.DB

func connect() *pg.DB {
	opts := &pg.Options{
		User:     os.Getenv("DB_USER"),
		Password: os.Getenv("DB_PASSWORD"),
		Addr:     os.Getenv("DB_ADDR"),
		Database: os.Getenv("DB_DATABASE"),
	}

	var db *pg.DB = pg.Connect(opts)

	if db == nil {
		log.Println("Database connection failed")
		os.Exit(100)
	} else {
		log.Println("connection successful")
	}

	if err := createSchema(db); err != nil {
		log.Fatal(err)
	}

	return db
}

func createSchema(db *pg.DB) error {

	models := []interface{}{
		(*User)(nil),
		(*Contact)(nil),
		(*Message)(nil),
		(*Call)(nil),
	}
	for _, model := range models {
		if error := db.Model(model).CreateTable(&orm.CreateTableOptions{
			Temp:        false,
			IfNotExists: true,
		}); error != nil {
			return error
		}
	}

	return nil
}
