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
	return nil, nil
}
