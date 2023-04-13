# Use an arm64v8 image as the base image
FROM arm64v8/golang:1.16-alpine3.13

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN go build -o /docker-gs-ping

EXPOSE 3000

ENTRYPOINT ["/docker-gs-ping"]
