FROM supabase/storage-api:v1.37.1

ENV VERSION=1.37.1

ENV POSTGREST_URL="http://rest:3000"
ENV REQUEST_ALLOW_X_FORWARDED_PATH=true
ENV FILE_SIZE_LIMIT=52428800
ENV STORAGE_BACKEND=file
ENV FILE_STORAGE_BACKEND_PATH="/var/lib/storage"
ENV TENANT_ID=stub
ENV REGION=stub
ENV GLOBAL_S3_BUCKET=stub
ENV ENABLE_IMAGE_TRANSFORMATION=true
ENV IMGPROXY_URL="http://imgproxy:5001"

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 \
  CMD wget --no-verbose --tries=1 --spider http://storage:5000/status || exit 0

CMD ["node", "dist/start/server.js"]