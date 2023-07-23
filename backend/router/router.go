package router

import (
	"net/http"
	"tidy/internal/user"
	"tidy/internal/websocket"

	"github.com/gorilla/mux"
)

func InitRouter(userHandler *user.Handler, WsHandler *websocket.Handler) *mux.Router {

	router := mux.NewRouter()

	router.HandleFunc("/signup", userHandler.CreateUser).Methods("POST")
	router.HandleFunc("/signin", userHandler.Login).Methods("POST")
	router.HandleFunc("/signout", userHandler.Logout).Methods("GET")

	router.HandleFunc("/ws/createRoom", WsHandler.CreateRoom).Methods("POST")
	router.HandleFunc("/ws/joinRoom/:roomId", WsHandler.JoinRoom).Methods("GET")
	router.HandleFunc("/ws/getRooms", WsHandler.GetRooms).Methods("GET")
	router.HandleFunc("/ws/getClients/:roomId", WsHandler.GetClients).Methods("GET")

	return router
}

func Start(address string, router *mux.Router) {
	http.ListenAndServe(address, router)
}
