package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	// CLI arguments. We just need `port`, `host`, and `dir` (directory) of html files to serve.
	// Default to localhost:8080 and cwd
	port := flag.Int("port", 8080, "Port to listen on")
	// host := flag.String("host", "127.0.0.1", "Host to listen on")
	host := "127.0.01"
	dir := flag.String("dir", ".", "Directory to serve")
	flag.Parse()

	// Verify directory of benchmark files to serve exist and then setup the file server
	if _, err := os.Stat(*dir); os.IsNotExist(err) {
		log.Fatalf("Directory %s does not exist\n", *dir)
	}
	fs := http.FileServer(http.Dir(*dir))
	http.Handle("/", fs)

	// If everything is OK, we can start the server and host the files
	address := fmt.Sprintf("%s:%d", *host, *port)
	log.Printf("Serving %s on HTTP %s:%d\n", *dir, address)
	err := http.ListenAndServe(address, nil)
	if err != nil {
		log.Fatal(err)
	}
}

// TODO: add some tests
