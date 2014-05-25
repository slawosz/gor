#!/bin/sh -e

if [ ! -h gopath/src/github.com/buger/gor ]; then
  mkdir -p gopath/src/github.com/buger/
  ln -s ../../../.. gopath/src/github.com/buger/gor
fi

export GOBIN=${PWD}/bin
export GOPATH=${PWD}/gopath

go get
go install github.com/buger/gor
