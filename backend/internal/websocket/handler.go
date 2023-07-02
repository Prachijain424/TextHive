package websocket

import (
	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
	"net/http"
)

type Handler struct {
	Hub *Hub
}

type CreateRoomRequest struct {
	ID   string `json:"id"`
	name string `json:"name"`
}

func NewHandler(h *Hub) *Handler {
	return &Handler{
		h,
	}
}

func (h *Handler) CreateRoom(c *gin.Context) {
	var request CreateRoomRequest
	if err := c.ShouldBindJSON(&request); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	h.Hub.Rooms[request.ID] = &Room{
		ID:      request.ID,
		Name:    request.name,
		Clients: make(map[string]*Client, 0),
	}

	c.JSON(http.StatusOK, request)
}

var upgrader = websocket.Upgrader{
	HandshakeTimeout: 0,
	ReadBufferSize:   1024,
	WriteBufferSize:  1024,
	WriteBufferPool:  nil,
	Subprotocols:     nil,
	Error:            nil,
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
	EnableCompression: false,
}

func (h *Handler) JoinRoom(c *gin.Context) {
	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	client := &Client{
		ID:       c.Param("ClientId"),
		Conn:     *conn,
		Message:  make(chan *Message, 10),
		RoomID:   c.Param("roomId"),
		Username: c.Param("username"),
	}

	msg := &Message{
		Content:  "A new user has joined the room",
		RoomID:   c.Param("roomId"),
		Username: c.Param("username"),
	}
	h.Hub.Register <- client
	h.Hub.Broadcast <- msg

	go client.WriteMessage()
}

type RoomResponse struct {
	ID   string `json:"id"`
	Name string `json:"name"`
}

type ClientResponse struct {
	ID       string `json:"id"`
	Username string `json:"username"`
}

func (h *Handler) GetRooms(c *gin.Context) {
	rooms := make([]RoomResponse, 0)

	for _, room := range h.Hub.Rooms {
		rooms = append(rooms, RoomResponse{
			ID:   room.ID,
			Name: room.Name,
		})
	}

	c.JSON(http.StatusOK, rooms)
}

func (h *Handler) GetClients(c *gin.Context) {
	clients := make([]ClientResponse, 0)
	roomId := c.Param("roomId")

	if _, ok := h.Hub.Rooms[roomId]; !ok {
		c.JSON(http.StatusOK, clients)
	}

	for _, client := range h.Hub.Rooms[roomId].Clients {
		clients = append(clients, ClientResponse{
			ID:       client.ID,
			Username: client.Username,
		})
	}

	c.JSON(http.StatusOK, clients)
}
