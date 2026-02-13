FROM supabase/postgres:15.8.1.085

ENV VERSION=15.8.1

HEALTHCHECK --interval=10s --timeout=10s --retries=10 \
  CMD pg_isready -U postgres -h localhost

COPY ./migrations/97-_supabase.sql /docker-entrypoint-initdb.d/migrations/97-_supabase.sql
COPY ./migrations/99-logs.sql /docker-entrypoint-initdb.d/migrations/99-logs.sql   
COPY ./migrations/99-pooler.sql /docker-entrypoint-initdb.d/migrations/99-pooler.sql      
COPY ./migrations/99-realtime.sql /docker-entrypoint-initdb.d/migrations/99-realtime.sql

COPY ./init-scripts/98-webhooks.sql /docker-entrypoint-initdb.d/init-scripts/98-webhooks.sql
COPY ./init-scripts/99-jwt.sql /docker-entrypoint-initdb.d/init-scripts/99-jwt.sql 
COPY ./init-scripts/99-roles.sql /docker-entrypoint-initdb.d/init-scripts/99-roles.sql

COPY --chmod=0755 ./entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf", "-c", "log_min_messages=fatal"]