package user

import (
	"context"
	"encoding/json"
	"net/http"
	"tidy/util"
)

type Handler struct {
	Service
}

func NewHandler(s *Service) *Handler {
	return &Handler{*s}
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

func (h *Handler) CreateUser(w http.ResponseWriter, r *http.Request) {

	ctx := context.Background()
	var user CreateUserRequest
	err := parseRequest(r, &user)
	if err != nil {
		JSONError(w, err, http.StatusBadRequest)
		return
	}

	res, err := h.Service.CreateUser(ctx, user)

	if err != nil {
		JSONError(w, err, http.StatusInternalServerError)
		return
	}

	payload, _ := json.Marshal(res)
	w.Header().Set("Content-Type", "application/json")
	w.Write(payload)
}

func (h *Handler) Login(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	var userCredentials LoginRequest
	err := parseRequest(r, &userCredentials)
	if err != nil {
		JSONError(w, err, http.StatusBadRequest)
		return
	}

	user, err := h.Service.Login(ctx, &userCredentials)

	if err != nil {
		JSONError(w, err, http.StatusInternalServerError)
		return
	}
	util.
	util.setCookieHandler(w, r)

	res := &LoginResponse{ID: user.ID, Username: user.Username}

	payload, _ := json.Marshal(res)
	w.Header().Set("Content-Type", "application/json")
	w.Write(payload)
}

func (h *Handler) Logout(w http.ResponseWriter, r *http.Request) {
	util.deleteCookieHandler(w, r)
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte("Successfully logged out!"))
}
