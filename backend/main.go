package main

import (
	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
	"log"
	"net/http"
)

func main() {
	if err := godotenv.Load(); err != nil {
		log.Fatal(err)
	}

	Db = connect()
	defer Db.Close()

	router := mux.NewRouter()

	groupV1 := router.PathPrefix("/api/v1").Subrouter()

	router.HandleFunc("/login", Login).Methods("GET")
	groupV1.HandleFunc("/register", Register).Methods("POST")

	log.Fatal(http.ListenAndServe(":8000", router))

}
