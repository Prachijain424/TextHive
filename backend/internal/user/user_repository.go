package user

import (
	"context"
	"database/sql"
)

type DBTX interface {
	//ExecContent(ctx context.Context, query string, args ...interface{})
	//PrepareContext(context.Context, string)
	QueryContext(context.Context, string, ...interface{}) (*sql.Rows, error)
	QueryRowContext(context.Context, string, ...interface{}) *sql.Row
}

type repository struct {
	db DBTX
}

func NewRepository(db DBTX) Repository {
	return &repository{
		db: db,
	}
}

func (r *repository) CreateUser(ctx context.Context, user *User) (*User, error) {
	var lastInsertedId int
	query := "INSERT INTO users(username, password, email) VALUES ($1, $2, $3) returning id"
	if err := r.db.QueryRowContext(ctx, query, user.Username, user.Password, user.Email).Scan(&lastInsertedId); err != nil {
		return nil, err
	}
	user.ID = int64(lastInsertedId)
	return user, nil
}

func (r *repository) GetUserByEmail(ctx context.Context, email string) (*User, error) {
	user := User{}
	query := "SELECT id, email, username, password FROM users WHERE email = $1"
	if err := r.db.QueryRowContext(ctx, query, email).Scan(&user.ID, &user.Email, &user.Username, &user.Password); err != nil {
		return nil, err
	}
	return &user, nil
}
