FROM supabase/gotrue:v2.185.0

ENV VERSION=2.185.0

COPY --chmod=755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:9999/health || exit 1

CMD ["auth"]
