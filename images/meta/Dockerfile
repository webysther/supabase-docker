FROM supabase/postgres-meta:v0.95.2

ENV VERSION=0.95.2

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]
