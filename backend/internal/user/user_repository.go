package user

import (
	"context"
	"errors"

	"gorm.io/gorm"
)

type repository struct {
	db *gorm.DB
}

func NewRepository(db *gorm.DB) Repository {
	return &repository{
		db: db,
	}
}

func (r *repository) CreateUser(ctx context.Context, user *User) (*User, error) {
	var lastInsertedId int
	db := r.db.Table("user").Create(user)
	if db.Error != nil {
		return nil, db.Error
	}
	if db.RowsAffected == 0 {
		return nil, errors.New("db didn't get updated")
	}
	user.UserID = int64(lastInsertedId)
	return user, nil
}

func (r *repository) GetUserByEmail(ctx context.Context, email string) (*User, error) {
	user := User{}
	return &user, nil
}
