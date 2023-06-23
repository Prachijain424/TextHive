package user

import "golang.org/x/net/context"

type User struct {
	ID       int64  `json:"id" db:"id"`
	UserName string `json:"userName" db:"username"`
	Email    string `json:"email" db:"email"`
	Password string `json:"password" db:"password"`
}

type Repository interface {
	CreateUser(ctx context.Context, user *User) (*User, error)
}
