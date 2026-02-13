FROM supabase/supavisor:2.7.4

ENV VERSION=2.7.4

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD curl -sSfL --head -o /dev/null http://127.0.0.1:4000/api/health || exit 1

COPY ./pooler.exs /etc/pooler/pooler.exs

COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

CMD ["/bin/sh", "-c", "/app/bin/migrate && /app/bin/supavisor eval \"$(cat /etc/pooler/pooler.exs)\" && /app/bin/server"]
