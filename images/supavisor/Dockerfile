FROM supabase/supavisor:2.7.4

ENV VERSION=2.7.4

ENV PORT=4000
ENV CLUSTER_POSTGRES=true
ENV REGION=local
ENV ERL_AFLAGS="-proto_dist inet_tcp"

ENV POOLER_POOL_MODE=transaction
ENV POOLER_DEFAULT_POOL_SIZE=20
ENV POOLER_MAX_CLIENT_CONN=100
ENV POOLER_DB_POOL_SIZE=5

HEALTHCHECK --interval=10s --timeout=10s --retries=10 \
  CMD curl -sSfL --head -o /dev/null http://127.0.0.1:4000/api/health || exit 1

ADD https://raw.githubusercontent.com/supabase/supabase/4bad8499ae08f558bca96d163e4f29b2e8783198/docker/volumes/pooler/pooler.exs \
    /etc/pooler/pooler.exs

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

CMD ["/bin/sh", "-c", "/app/bin/migrate && /app/bin/supavisor eval \"$(cat /etc/pooler/pooler.exs)\" && /app/bin/server"]
