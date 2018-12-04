FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk --no-cache add tzdata \
    && apk --no-cache add openssl \
    && apk --no-cache add ca-certificates \
    && rm -rf /var/cache/apk/ \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

WORKDIR /mnt/work