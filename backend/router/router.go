package router

import (
	"tidy/internal/user"
	"tidy/internal/websocket"
	"github.com/gin-gonic/gin"
)

var router *gin.Engine

func InitRouter(userHandler *user.Handler, WsHandler *websocket.Handler) {
	router = gin.Default()
	router.POST("/signup", userHandler.CreateUser)
	router.POST("/signin", userHandler.Login)
	router.GET("/signout", userHandler.Logout)
	router.POST("/ws/createRoom", WsHandler.CreateRoom)
	router.GET("/ws/joinRoom/:roomId", WsHandler.JoinRoom)
	router.GET("/ws/getRooms", WsHandler.GetRooms)
	router.POST("/ws/getClients/:roomId", WsHandler.GetClients)
}

func Start(address string) {
	router.Run(address)
}
