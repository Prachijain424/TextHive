package main

import (
	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
	"log"
)

func main() {
	if err := godotenv.Load(); err != nil {
		log.Fatal(err)
	}

	router := mux.NewRouter()

	groupV1 := router.PathPrefix("/api/v1").Subrouter()

	router.HandleFunc("/login", Login).Methods("GET")
	groupV1.HandleFunc("/register", Register).Methods("POST")

}
