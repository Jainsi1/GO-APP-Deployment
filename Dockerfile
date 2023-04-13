# # syntax=docker/dockerfile:1

# FROM golang:1.16-alpine

# WORKDIR /app

# COPY go.mod ./
# RUN go mod download

# COPY *.go ./

# RUN go build -o /docker-gs-ping

# EXPOSE 3000

# ENTRYPOINT ["/docker-gs-ping"]

#!/bin/bash

FROM golang:latest

WORKDIR /app

COPY . /app

# Download and install any required dependencies
RUN go mod download

# Compile the Go app
RUN go build -o app

# Expose port 8080 to the outside world
EXPOSE 3000

# Define the command to run the Go app when the container starts
CMD ["./app"]

# COPY . .
# RUN go get -d -v ./...
# RUN go install -v ./...
# CMD ["app"]
