FROM timberio/vector:0.28.1-alpine

ENV VERSION=0.28.1

HEALTHCHECK --interval=5s --timeout=5s --retries=3 \
    CMD wget --no-verbose --tries=3 --spider http://vector:9001/health || exit 1

COPY ./vector.yml /etc/vector/vector.yml

CMD ["--config", "/etc/vector/vector.yml"]
