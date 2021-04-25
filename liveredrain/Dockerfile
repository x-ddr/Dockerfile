FROM python:alpine
LABEL maintainer="Evine Deng <evinedeng@foxmail.com>"
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    HOME=/root \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ "
COPY liveredrain/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
    && apk --no-cache add -f \
        bash \
        coreutils \
        moreutils \
        git \
        wget \
        nano \
        tzdata \
        perl \
    && rm -rf /var/cache/apk/* \
    && chmod +x /usr/local/bin/docker-entrypoint.sh \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    # && pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple \
    && python -m pip install --upgrade pip \
    && pip install telethon pysocks httpx
WORKDIR /live
ENTRYPOINT ["docker-entrypoint.sh"]