FROM ubuntu:latest
COPY --from=nevinee/s6-overlay-stage:latest / /
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
ENTRYPOINT ["/init"]