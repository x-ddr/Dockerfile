FROM alpine:latest
COPY --from=nevinee/s6-overlay-stage:latest / /
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
ENTRYPOINT ["/init"]