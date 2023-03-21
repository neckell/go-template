package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

func main() {
	fmt.Println("Hello, World!")

	http.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/plain")
		w.WriteHeader(http.StatusOK)

		io.WriteString(w, "Hello world\n")
	})

	err := http.ListenAndServe(":9000", nil)

	if err != nil {
		log.Fatalf("Could not start server: %s\n", err.Error())
	}
}