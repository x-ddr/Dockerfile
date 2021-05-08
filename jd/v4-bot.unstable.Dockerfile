FROM alpine:latest AS builder
WORKDIR /phantomjs
RUN apk add --no-cache -f \
        build-base \
        flex-dev \
        freetype-dev \
        sqlite-dev \
        openssl-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        libjpeg \
        libx11-dev \
        libxext-dev \
        icu-dev \
        bison \
        git \
        gperf \
        ruby \
        perl \
        python3 \
        fontconfig \
        linux-headers \
    && git clone git://github.com/ariya/phantomjs.git /phantomjs
    && git checkout 2.1.1 \
    && git submodule init \
    && git submodule update \
    && python3 build.py \
        --confirm \
        --silent \
        --release \
        --qt-config="-system-libjpeg" \
        --git-clean-qtbase \
        --git-clean-qtwebkit

FROM nevinee/jd:v4-unstable
COPY --from=builder /phantomjs/bin/phantomjs /usr/local/bin
RUN echo "========= 安装必要软件 =========" \
    && apk add --no-cache -f \
        jq \
        python3 \
        zlib-dev \
        jpeg-dev \
        freetype-dev \
    && echo "========= 安装编译软件 =========" \
    && apk add --no-cache --virtual .build \
        gcc \
        python3-dev \
        musl-dev \
    && echo "========= 创建软链接 =========" \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && chmod +x /usr/local/bin/phantomjs \
    && echo "========= 运行 pip install =========" \
    && pip3 install --upgrade pip \
    && cd $JD_DIR/jbot \
    && pip3 install -r requirements.txt \
    && echo "========= 清理 =========" \
    && apk del .build \
    && rm -rf /root/.cache /var/cache/apk/*
