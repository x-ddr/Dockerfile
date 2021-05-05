FROM rust:latest AS builder

WORKDIR /loop
RUN git clone https://github.com/Miserlou/Loop.git /loop \
    && cargo build --release

FROM alpine:latest

COPY --from=builder /loop/target/release/loop /usr/local/bin/loop
