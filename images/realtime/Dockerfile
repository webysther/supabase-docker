FROM supabase/realtime:v2.72.0

ENV VERSION=2.72.0

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 --start-period=10s \
  CMD curl -sSfL --head -o /dev/null -H "Authorization: Bearer ${ANON_KEY}" \
    http://localhost:4000/api/tenants/realtime-dev/health || exit 1

CMD ["/app/bin/server"]