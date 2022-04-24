package main

import (
	"fmt"
	peparser "github.com/saferwall/pe"
	"log"
	"os"
)

func main() {
	filename := os.Args[1]
	pe, err := peparser.New(filename, &peparser.Options{})
	if err != nil {
		log.Fatalf("Error while opening file: %s, reason: %v", filename, err)
	}

	err = pe.Parse()
	if err != nil {
		log.Fatalf("Error while parsing file: %s, reason: %v", filename, err)
	}
	for _, i := range pe.Imports {
		fmt.Printf("%s ", i.Name)
	}
	fmt.Println("")
}
