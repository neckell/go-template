##
## Build
##

FROM golang:1.20.2 AS build

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY *.go ./

RUN go build -o /go-template

##
## Deploy
##

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /go-template /go-template

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/go-template"]