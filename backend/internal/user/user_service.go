package user

import (
	"golang.org/x/net/context"
	"time"
)

type service struct {
	Repository
	timeout time.Duration
}

func NewService(repository Repository) Service {
	return &service{
		repository, time.Duration(2) * time.Second,
	}
}

func (s *service) CreateUser(ctx context.Context, req *CreateUserRequest) (*CreateUserResponse, error) {
	//ctx, cancel := context.WithTimeout(ctx, s.timeout)
	//defer cancel()

	return nil, nil
}
