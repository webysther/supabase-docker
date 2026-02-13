FROM supabase/storage-api:v1.37.1

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

HEALTHCHECK --timeout=5s --interval=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://storage:5000/status || exit 0
