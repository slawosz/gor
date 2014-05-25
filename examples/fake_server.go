package main

import (
  "fmt"
  "net/http"

  "flag"
  "time"
)

func handler(w http.ResponseWriter, r *http.Request) {
  w.Header().Add("Server", "Gor Example Server")
  fmt.Fprintf(w, "Hi there, I love %s!", r.URL.Path[1:])
  fmt.Println("[" + time.Now().String() + "]", r.Method, r.URL.Path[1:])
}

func main() {
  var port = flag.String("port", "8080", "port to run server")
  flag.Parse()
  http.HandleFunc("/", handler)
  fmt.Println("Server started to listen on", *port)
  http.ListenAndServe(":" + *port, nil)
}
