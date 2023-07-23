package websocket

import (
	"encoding/json"
	"net/http"

	"github.com/gorilla/websocket"
)

type Handler struct {
	Hub *Hub
}

type CreateRoomRequest struct {
	ID   string `json:"id"`
	Name string `json:"name"`
}

func NewHandler(h *Hub) *Handler {
	return &Handler{
		h,
	}
}

func parseRequest(r *http.Request, requestBody interface{}) error {

	decoder := json.NewDecoder(r.Body)
	err := decoder.Decode(&requestBody)

	if err != nil {
		return err
	}
	return nil
}

func JSONError(w http.ResponseWriter, err interface{}, code int) {
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.Header().Set("X-Content-Type-Options", "nosniff")
	w.WriteHeader(code)
	json.NewEncoder(w).Encode(err)
}

func (h *Handler) CreateRoom(w http.ResponseWriter, r *http.Request) {
	var request CreateRoomRequest
	err := parseRequest(r, &request)
	if err != nil {
		JSONError(w, err, http.StatusBadRequest)
		return
	}

	h.Hub.Rooms[request.ID] = &Room{
		ID:      request.ID,
		Name:    request.Name,
		Clients: make(map[string]*Client, 0),
	}

	payload, _ := json.Marshal(request)
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.Write(payload)
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

func (h *Handler) JoinRoom(w http.ResponseWriter, r *http.Request) {
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {

		return
	}

	client := &Client{
		ID:       r.FormValue("ClientId"),
		Conn:     conn,
		Message:  make(chan *Message, 10),
		RoomID:   r.FormValue("roomId"),
		Username: r.FormValue("username"),
	}

	msg := &Message{
		Content:  "A new user has joined the room",
		RoomID:   r.FormValue("roomId"),
		Username: r.FormValue("username"),
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

func (h *Handler) GetRooms(w http.ResponseWriter, r *http.Request) {
	rooms := make([]RoomResponse, 0)

	for _, room := range h.Hub.Rooms {
		rooms = append(rooms, RoomResponse{
			ID:   room.ID,
			Name: room.Name,
		})
	}

	payload, _ := json.Marshal(rooms)
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.Write(payload)
}

func (h *Handler) GetClients(w http.ResponseWriter, r *http.Request) {
	clients := make([]ClientResponse, 0)
	roomId := r.FormValue("roomId")

	if _, ok := h.Hub.Rooms[roomId]; !ok {
		payload, _ := json.Marshal(clients)
		w.Header().Set("Content-Type", "application/json; charset=utf-8")
		w.Write(payload)
	}

	for _, client := range h.Hub.Rooms[roomId].Clients {
		clients = append(clients, ClientResponse{
			ID:       client.ID,
			Username: client.Username,
		})
	}

	payload, _ := json.Marshal(clients)
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.Write(payload)
}
