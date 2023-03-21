# syntax=docker/dockerfile:1

FROM golang:1.20.2

WORKDIR /app

COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN go build -o /go-template

EXPOSE 8080

CMD [ "/go-template" ]