FROM supabase/realtime:v2.72.0

ENV VERSION=2.72.0

COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

HEALTHCHECK --timeout=5s --interval=30s --retries=3 --start-period=10s \
  CMD curl -sSfL --head -o /dev/null -H "Authorization: Bearer ${ANON_KEY}" \
    http://localhost:4000/api/tenants/realtime-dev/health || exit 1
