#!/bin/sh

set -e

export GOPATH=$(pwd)/gopath:$(pwd)/gopath/src/github.com/jackycsl/vs-go-demo/Godeps/_workspace
cd gopath/src/github.com/jackycsl/vs-go-demo/

go test ./...
