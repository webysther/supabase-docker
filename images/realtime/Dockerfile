FROM supabase/realtime:v2.72.0

ENV VERSION=2.72.0

ENV PORT=4000
ENV DB_USER=supabase_admin
ENV DB_AFTER_CONNECT_QUERY="SET search_path TO _realtime"
ENV ERL_AFLAGS="-proto_dist inet_tcp"
ENV DNS_NODES="''"
ENV RLIMIT_NOFILE=10000
ENV APP_NAME=realtime
ENV SEED_SELF_HOST=true
ENV RUN_JANITOR=true
ENV DISABLE_HEALTHCHECK_LOGGING=true

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 --start-period=10s \
  CMD curl -sSfL --head -o /dev/null -H "Authorization: Bearer ${ANON_KEY}" \
    http://localhost:4000/api/tenants/realtime-dev/health || exit 1

CMD ["/app/bin/server"]