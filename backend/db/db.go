package db

import (
	"database/sql"
	"fmt"
	"log"
	_ "github.com/lib/pq"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
)

type Database struct {
	db *sql.DB
}

func NewDatabase() (*gorm.DB, error) {

	connString := fmt.Sprintf("dbname=%s host=%s user=%s port=%d sslmode=disable",
	"text_hive_db", "localhost", "lalit", 5432)

	database, err := gorm.Open(
		postgres.Open(connString),
		&gorm.Config{
			NamingStrategy: schema.NamingStrategy{SingularTable: true},
			Logger:         logger.Default.LogMode(logger.Info),
		},
	)
	if err != nil {
		log.Fatalf("Failed to open connection to postgresdb\n: %v", err)
		return nil, err
	}

	sqlDB, err := database.DB()
	if err != nil {
		log.Fatalf("Failed to conenct to postgresdb\n: %v", err)
		return nil, err
	}
	if sqlDB.Ping() != nil {
		log.Fatalf("Failed to ping to postgresdb\n: %v", err)
		return nil, err
	}
	return database, nil
}

func (d *Database) Close() {
	d.db.Close()
}

func (d *Database) GetDB() *sql.DB {
	return d.db
}
