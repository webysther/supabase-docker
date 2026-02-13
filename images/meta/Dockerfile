FROM supabase/postgres-meta:v0.95.2

ENV VERSION=0.95.2

ENV PG_META_PORT=8080
ENV PG_META_DB_USER=supabase_admin

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

CMD ["node", "dist/server/server.js"]