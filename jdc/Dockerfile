FROM alpine:latest
COPY --from=nevinee/s6-overlay-stage:latest / /
COPY jdc/s6-overlay /
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    JD_DIR=/jd
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && echo "========= 安装软件 =========" \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f \
       bash \
       coreutils \
       diffutils \
       git \
       jq \
       wget \
       curl \
       nano \
       tzdata \
       perl \
       openssl \
       openssh-client \
       parallel \
       nodejs-lts \
       npm \
    && echo "========= 修改时区 =========" \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && echo "========= 清理 =========" \
    && rm -rf /root/.npm /var/cache/apk/*
ENTRYPOINT ["/init"]
WORKDIR $JD_DIR
