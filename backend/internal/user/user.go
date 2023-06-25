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

type CreateUserRequest struct {
	ID       int64  `json:"id" db:"id"`
	UserName string `json:"userName" db:"username"`
	Email    string `json:"email" db:"email"`
}

type CreateUserResponse struct {
	ID       int64  `json:"id" db:"id"`
	UserName string `json:"userName" db:"username"`
	Email    string `json:"email" db:"email"`
}

type Service interface {
	CreateUser(ctx context.Context, request *CreateUserRequest) (*CreateUserResponse, error)
}
