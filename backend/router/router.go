package router

import (
	"github.com/gin-gonic/gin"
	"tidy/internal/user"
)

var router *gin.Engine

func InitRouter(handler *user.Handler) {
	router = gin.Default()
	router.POST("/signup", handler.CreateUser)
	router.POST("/signin", handler.Login)
	router.GET("/signout", handler.Logout)
}

func Start(address string) {
	router.Run(address)
}
