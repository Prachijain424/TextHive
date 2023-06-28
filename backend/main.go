package main

import (
	"log"
	"tidy/db"
	"tidy/internal/user"
	"tidy/router"
)

func main() {
	dbConn, err := db.NewDatabase()
	if err != nil {
		log.Fatalf("could not initialise db connection %s", err)
	}

	repo := user.NewRepository(dbConn.GetDB())
	service := user.NewService(&repo)
	handler := user.NewHandler(&service)

	router.InitRouter(handler)
	router.Start("localhost:3000")
}
