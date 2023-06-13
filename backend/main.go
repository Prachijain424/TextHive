package main

import db "tidy/database"

func main() {
	_, err := db.NewDatabase()

	if err != nil {

	}

}
