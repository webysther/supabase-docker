FROM timberio/vector:0.28.1-alpine

ENV VERSION=0.28.1

HEALTHCHECK --interval=10s --timeout=10s --retries=10 \
    CMD wget --no-verbose --tries=3 --spider http://vector:9001/health || exit 1

ADD https://raw.githubusercontent.com/supabase/supabase/878667cc2d85b504587d8d7f8e2b5bdeac508573/docker/volumes/logs/vector.yml \
    /etc/vector/vector.yml

CMD ["--config", "/etc/vector/vector.yml"]
