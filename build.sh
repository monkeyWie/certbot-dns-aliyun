#!/bin/sh
export GOOS=linux
export GOARCH=amd64
go build -o certbot-aliyun main.go