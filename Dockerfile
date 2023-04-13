# Use an official Golang runtime as a parent image
FROM golang:1.16-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Build the Go app
RUN go build -o app

# Expose port 3000 for the container
EXPOSE 3000

# Set the command to run the binary executable
CMD ["./app"]
