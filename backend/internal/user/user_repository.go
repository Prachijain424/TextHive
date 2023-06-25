package user

import (
	"context"
	"database/sql"
)

type DBTX interface {
	ExecContent(ctx context.Context, query string, args ...interface{})
	PrepareContext(context.Context, string)
	QueryContext(context.Context, string, ...interface{}) (*sql.Rows, error)
	QueryRowContext(context.Context, string, ...interface{}) *sql.Row
}

type repository struct {
	db DBTX
}

func newRepository(db DBTX) Repository {
	return &repository{
		db: db,
	}
}

func (r *repository) CreateUser(ctx context.Context, user *User) (*User, error) {
	var lastInsertedId int
	query := "INSERT INTO users(username, password, email) VALUES ($1, $2, $3) returning id"
	if err := r.db.QueryRowContext(ctx, query, user.UserName, user.Password, user.Email).Scan(lastInsertedId); err != nil {
		return nil, err
	}
	user.ID = int64(lastInsertedId)
	return nil, nil
}
