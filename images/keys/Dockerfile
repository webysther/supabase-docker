FROM alpine:3

ENV VERSION=latest

RUN apk add --no-cache openssl

COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
