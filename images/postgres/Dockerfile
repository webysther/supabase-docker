FROM supabase/postgres:15.8.1.085

ENV VERSION=15.8.1

ENV POSTGRES_HOST=/var/run/postgresql

COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

COPY ./migrations/ /docker-entrypoint-initdb.d/migrations
COPY ./init-scripts/ /docker-entrypoint-initdb.d/init-scripts

HEALTHCHECK --interval=5s --timeout=5s --retries=10 \
        CMD pg_isready -U postgres -h localhost

# Default command to start PostgreSQL with minimal logging
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf", "-c", "log_min_messages=fatal"]