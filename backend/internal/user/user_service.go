package user

import (
	"golang.org/x/net/context"
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
		*repository, time.Duration(2) * time.Hour,
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
