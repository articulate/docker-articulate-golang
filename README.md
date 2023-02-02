# Articulate Golang Images

> Deprecated: See notes below

Base golang image

## Deploying Go Applications

Since you compile Go applications, you shouldn't be deploying Go services with
this image. Instead you should use a multistage build.

```dockerfile
# syntax=docker/dockerfile:1
FROM golang:1.20 AS build

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o /service

FROM debian:bullseye

ARG TARGETARCH
ADD --chmod=755 https://github.com/articulate/docker-consul-template-bootstrap/releases/latest/download/docker-consul-template-bootstrap_linux_${TARGETARCH} /entrypoint

COPY --from=build /service /service

ENTRYPOINT [ "/entrypoint" ]
CMD [ "/service" ]
```
