package main

import (
	"time"
)

type User struct {
	UserID           int `gorm:"primaryKey"`
	Name             string
	Email            string
	Password         string
	Phone            string
	Contacts         []Contact `gorm:"foreignKey:UserID"`
	SentMessages     []Message `gorm:"foreignKey:SenderID"`
	ReceivedMessages []Message `gorm:"foreignKey:ReceiverID"`
	OutgoingCalls    []Call    `gorm:"foreignKey:Caller"`
	IncomingCalls    []Call    `gorm:"foreignKey:Receiver"`
}

type Contact struct {
	ContactID int `gorm:"primaryKey"`
	Title     string
	UserID    int
}

type Message struct {
	MessageID  int `gorm:"primaryKey"`
	Message    string
	SenderID   int
	ReceiverID int
	SendTime   time.Time
}

type Call struct {
	CallID   int `gorm:"primaryKey"`
	Duration time.Time
	Caller   int
	Receiver int
}
