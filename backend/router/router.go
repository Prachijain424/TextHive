package router

import (
	"github.com/gin-gonic/gin"
	"tidy/internal/user"
)

var router *gin.Engine

func InitRouter(handler *user.Handler) {
	router = gin.Default()
	router.POST("/signup", handler.CreateUser)
}

func Start(address string) {
	router.Run(address)
}
