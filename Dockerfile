# # syntax=docker/dockerfile:1

# FROM golang:1.16-alpine

# WORKDIR /app

# COPY go.mod ./
# RUN go mod download

# COPY *.go ./

# RUN go build -o /docker-gs-ping

# EXPOSE 3000

# ENTRYPOINT ["/docker-gs-ping"]

FROM golang:latest
WORKDIR /app
COPY . .
RUN go get -d -v ./...
RUN go install -v ./...
CMD ["app"]
