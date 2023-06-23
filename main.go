package main

import (
	"log"
	"tidy/db"
)

func main() {
	_, err := db.NewDatabase()

	if err != nil {
		log.Fatalf("could not initialise db connection %s", err)
	}
}
