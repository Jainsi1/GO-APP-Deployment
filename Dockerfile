FROM golang:latest AS builder

WORKDIR /app

COPY . /app

# Download and install any required dependencies
RUN go mod download

# Compile the Go app for arm64
RUN GOARCH=arm64 go build -o app

FROM arm64v8/alpine:latest

RUN apk update && apk add ca-certificates

WORKDIR /app

COPY --from=builder /app/app .

# Expose port 3000 to the outside world
EXPOSE 3000

# Define the command to run the Go app when the container starts
CMD ["./app"]
