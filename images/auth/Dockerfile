FROM supabase/gotrue:v2.185.0

ENV VERSION=2.185.0

COPY --chmod=755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

HEALTHCHECK --timeout=5s --interval=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:9999/health || exit 1