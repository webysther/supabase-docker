FROM supabase/studio:2026.01.27-sha-6aa59ff

ENV VERSION=2026.01.27

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK NONE

CMD ["node", "apps/studio/server.js"]