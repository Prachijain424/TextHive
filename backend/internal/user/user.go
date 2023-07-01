package user

import (
	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/net/context"
)

type User struct {
	ID       int64  `json:"id" db:"id"`
	Username string `json:"username" db:"username"`
	Email    string `json:"email" db:"email"`
	Password string `json:"password" db:"password"`
}

type Repository interface {
	CreateUser(ctx context.Context, user *User) (*User, error)
	GetUserByEmail(ctx context.Context, email string) (*User, error)
}

type CreateUserRequest struct {
	ID       int64  `json:"id"`
	Username string `json:"username"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

type CreateUserResponse struct {
	ID       string `json:"id"`
	Username string `json:"username"`
	Email    string `json:"email"`
}

type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type LoginResponse struct {
	AccessToken string
	ID          int64  `json:"id"`
	Username    string `json:"username"`
}

type JWTClaims struct {
	ID       string `json:"id"`
	Username string `json:"username"`
	jwt.RegisteredClaims
}

type Service interface {
	CreateUser(ctx context.Context, request CreateUserRequest) (*CreateUserResponse, error)
	Login(ctx context.Context, req *LoginRequest) (*LoginResponse, error)
}
