# syntax=docker/dockerfile:1
FROM alpine:latest AS downloader

ARG version
ARG arch

WORKDIR /

RUN wget "https://github.com/SagerNet/sing-box/releases/download/v${version}/sing-box-${version}-linux-${arch}.tar.gz" -O - | tar xz --strip-components=1

FROM gcr.io/distroless/static-debian12

COPY --link --from=downloader --chmod=755 /sing-box /sing-box

VOLUME /etc/sing-box

CMD ["/sing-box", "run", " -c", "/etc/sing-box/config.json"]
