FROM supabase/studio:2026.01.27-sha-6aa59ff

ENV VERSION=2026.01.27

ENV HOSTNAME="::"

ENV STUDIO_PG_META_URL="http://meta:8080"
ENV LOGFLARE_URL="http://analytics:4000"
ENV SUPABASE_URL="http://studio:3000"
ENV SUPABASE_PUBLIC_URL="http://localhost:8000"

ENV NEXT_PUBLIC_ENABLE_LOGS="false"
ENV NEXT_ANALYTICS_BACKEND_PROVIDER="postgres"

ENV SNIPPETS_MANAGEMENT_FOLDER="/app/snippets"
ENV EDGE_FUNCTIONS_MANAGEMENT_FOLDER="/app/edge-functions"

ENV NEXT_PUBLIC_ENABLE_LOGS=true

ENV STUDIO_DEFAULT_ORGANIZATION="Default Organization"
ENV STUDIO_DEFAULT_PROJECT="Default Project"

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK NONE

CMD ["node", "apps/studio/server.js"]