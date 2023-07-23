package user

import (
	"context"
	"encoding/json"
	"net/http"
	"time"
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

func setCookieHandler(w http.ResponseWriter, r *http.Request) {
	cookie := &http.Cookie{
		Name:     "jwt",
		Value:    "your_access_token_here",
		Expires:  time.Now().Add(1 * time.Hour),
		Path:     "/",
		Domain:   "localhost",
		HttpOnly: true,
		Secure:   false, // Set to true if using HTTPS
	}
	http.SetCookie(w, cookie)
}

func deleteCookieHandler(w http.ResponseWriter, r *http.Request) {
	cookie := &http.Cookie{
		Name:     "jwt",
		Value:    "",
		Expires:  time.Now().Add(-1 * time.Hour), // Set to a past time
		Path:     "/",
		Domain:   "localhost",
		HttpOnly: true,
		Secure:   false, // Set to true if using HTTPS
	}
	http.SetCookie(w, cookie)
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
	setCookieHandler(w, r)

	res := &LoginResponse{ID: user.ID, Name: user.Name}

	payload, _ := json.Marshal(res)
	w.Header().Set("Content-Type", "application/json")
	w.Write(payload)
}

func (h *Handler) Logout(w http.ResponseWriter, r *http.Request) {
	deleteCookieHandler(w, r)
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte("Successfully logged out!"))
}
