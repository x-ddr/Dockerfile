FROM alpine:latest AS builder

WORKDIR /loop
RUN apk update -f \
    && apk upgrade \
    && apk --no-cache add -f git build-base cargo \
    && git clone https://github.com/Miserlou/Loop.git /loop \
    && cargo build --release

FROM alpine:latest

COPY --from=builder /loop/target/release/loop /usr/local/bin/loop
