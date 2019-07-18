package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"text/template"
)

var ts *template.Template

func init() {
	ts = template.Must(template.ParseFiles("./ui/html/home.tmpl"))
}

func main() {

	mux := http.NewServeMux()
	mux.HandleFunc("/", home)
	mux.HandleFunc("/ping", ping)

	fileServer := http.FileServer(http.Dir("./ui/static/"))
	mux.Handle("/static/", http.StripPrefix("/static", fileServer))

	log.Println("Starting server on :4000")
	err := http.ListenAndServe(":4000", mux)
	log.Fatal(err)
}

func home(w http.ResponseWriter, r *http.Request) {
	hostname, _ := os.Hostname()
	ts.Execute(w, hostname)
}

func ping(w http.ResponseWriter, r *http.Request) {
	hostname, _ := os.Hostname()
	fmt.Fprintf(w, "pong from %v", hostname)
}
