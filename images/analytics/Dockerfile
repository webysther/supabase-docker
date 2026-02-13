FROM supabase/logflare:1.30.3

ENV VERSION=1.30.3

ENV DB_USERNAME=supabase_admin
ENV DB_DATABASE=_supabase
ENV DB_SCHEMA=_analytics
ENV POSTGRES_BACKEND_SCHEMA=_analytics
ENV LOGFLARE_NODE_HOST=127.0.0.1
ENV LOGFLARE_SINGLE_TENANT=true
ENV LOGFLARE_SUPABASE_MODE=true
ENV LOGFLARE_FEATURE_FLAG_OVERRIDE="multibackend=true"

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 \
  CMD curl http://localhost:4000/health

CMD ["sh", "run.sh"]