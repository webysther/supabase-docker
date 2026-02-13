FROM supabase/logflare:1.30.3

ENV VERSION=1.30.3

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

HEALTHCHECK --timeout=5s --interval=5s --retries=10 \
  CMD curl http://analytics:4000/health
