package user

import (
	"errors"
	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/net/context"
	"os"
	"strconv"
	"tidy/util"
	"time"
)

type service struct {
	Repository
	timeout time.Duration
}

func NewService(repository *Repository) Service {
	return &service{
		*repository, time.Duration(2) * time.Minute,
	}
}

func (s *service) CreateUser(ctx context.Context, req CreateUserRequest) (*CreateUserResponse, error) {
	ctx, cancel := context.WithTimeout(ctx, s.timeout)
	defer cancel()

	hashedPassword, err := util.HashedPassword(req.Password)
	if err != nil {
		return nil, err
	}

	user := &User{
		Username: req.Username,
		Email:    req.Email,
		Password: hashedPassword,
	}

	r, err := s.Repository.CreateUser(ctx, user)

	if err != nil {
		return nil, err
	}

	response := &CreateUserResponse{
		Username: r.Username,
		Email:    r.Email,
		ID:       strconv.Itoa(int(r.ID)),
	}

	return response, nil
}

func (s *service) Login(ctx context.Context, req *LoginRequest) (*LoginResponse, error) {
	ctx, cancel := context.WithTimeout(ctx, s.timeout)
	defer cancel()
	user, err := s.Repository.GetUserByEmail(ctx, req.Email)
	if err != nil {
		return nil, err
	}

	if err = util.CheckPassword(req.Password, user.Password); err != nil {
		return nil, errors.New("incorrect password")
	}

	claims := jwt.NewWithClaims(jwt.SigningMethodHS256, JWTClaims{
		ID:       strconv.Itoa(int(user.ID)),
		Username: user.Username,
		RegisteredClaims: jwt.RegisteredClaims{
			Issuer:    strconv.Itoa(int(user.ID)),
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(24 * time.Hour)),
		},
	})

	signedString, err := claims.SignedString([]byte(os.Getenv("SecretKey")))
	if err != nil {
		return nil, err
	}

	res := &LoginResponse{
		AccessToken: signedString,
		ID:          user.ID,
		Username:    user.Username,
	}
	return res, nil
}
