FROM rust:latest AS builder
ARG TARGET
WORKDIR /usr/src
RUN    git clone https://github.com/Miserlou/Loop.git loop \
    && cd loop \
    && rustup target install $TARGET \
    && cargo build --release --target=$TARGET

FROM alpine:latest
COPY --from=builder /usr/src/loop/target/$TARGET/release/loop /usr/local/bin/loop
