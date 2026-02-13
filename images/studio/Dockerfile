FROM supabase/studio:2026.01.27-sha-6aa59ff

ENV VERSION=2026.01.27

COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

HEALTHCHECK NONE

CMD ["node", "apps/studio/server.js"]