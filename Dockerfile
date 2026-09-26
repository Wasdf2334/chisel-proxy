FROM alpine:latest
RUN apk add --no-cache curl bash
RUN curl -L https://github.com/jpillora/chisel/releases/download/v1.11.8/chisel_1.11.8_linux_amd64.gz -o /tmp/chisel.gz && \
    gunzip /tmp/chisel.gz && \
    mv /tmp/chisel /usr/local/bin/chisel && \
    chmod +x /usr/local/bin/chisel
EXPOSE 3000
CMD chisel server --port ${PORT:-3000} --reverse --socks5
