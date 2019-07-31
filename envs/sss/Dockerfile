FROM golang:1.12.7-alpine3.9 as builder

RUN apk add -u --no-cache git

RUN go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-local
RUN go get github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-server

FROM alpine

ENV "GOPATH" "/go"

RUN apk add -u --no-cache tzdata ca-certificates && rm -rf /var/cache/apk/*

COPY --from=builder /go/bin/shadowsocks-server     /usr/local/bin/
COPY --from=builder /go/bin/shadowsocks-local      /usr/local/bin/

WORKDIR "/"
