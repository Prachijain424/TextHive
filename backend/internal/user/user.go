package user

import (
	"time"

	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/net/context"
)

type User struct {
	UserID           int64     `json:"userid" db:"userid" gorm:"primaryKey"`
	Name             string    `json:"name" db:"name"`
	PhoneNumber      int64     `json:"phonenumber" db:"phone_number" gorm:"unique"`
	Email            string    `json:"email" db:"email" gorm:"unique"`
	Password         string    `json:"password" db:"password"`
	Contacts         []Contact `gorm:"foreignKey:UserID"`
	SentMessages     []Message `gorm:"foreignKey:SenderID"`
	ReceivedMessages []Message `gorm:"foreignKey:ReceiverID"`
	CallsSent        []Call    `gorm:"foreignKey:SenderID"`
	CallsReceived    []Call    `gorm:"foreignKey:ReceiverID"`
}

type Contact struct {
	UserID        uint `gorm:"primaryKey"`
	ContactUserID uint `gorm:"unique"`
}

type Message struct {
	MessageID  uint `gorm:"primaryKey"`
	SenderID   uint
	ReceiverID uint
	Message    string
	SentAt     time.Time `gorm:"default:now()"`
}

type Call struct {
	CallID     uint `gorm:"primaryKey"`
	SenderID   uint
	ReceiverID uint
	Duration   int
	CalledAt   time.Time `gorm:"default:now()"`
}

type Repository interface {
	CreateUser(ctx context.Context, user *User) (*User, error)
	GetUserByEmail(ctx context.Context, email string) (*User, error)
}

type CreateUserRequest struct {
	ID       int64  `json:"userid"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
	Phone    string `json:phone`
}

type CreateUserResponse struct {
	ID    string `json:"id"`
	Name  string `json:"username"`
	Email string `json:"email"`
}

type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type LoginResponse struct {
	AccessToken string
	ID          int64  `json:"id"`
	Name    string `json:"name"`
}

type JWTClaims struct {
	ID   string `json:"id"`
	Name string `json:"name"`
	jwt.RegisteredClaims
}

type Service interface {
	CreateUser(ctx context.Context, request CreateUserRequest) (*CreateUserResponse, error)
	Login(ctx context.Context, req *LoginRequest) (*LoginResponse, error)
}
