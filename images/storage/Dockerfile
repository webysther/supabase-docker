FROM supabase/storage-api:v1.37.1

ENV VERSION=1.37.1

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 \
  CMD wget --no-verbose --tries=1 --spider http://storage:5000/status || exit 0

CMD ["node", "dist/start/server.js"]