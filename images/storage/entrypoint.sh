#!/usr/bin/env bash
set -Eeuo pipefail

export POSTGREST_URL="${POSTGREST_URL:-http://rest:3000}"
export DATABASE_URL="${DATABASE_URL:-postgres://supabase_storage_admin:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}}"
export REQUEST_ALLOW_X_FORWARDED_PATH="${REQUEST_ALLOW_X_FORWARDED_PATH:-true}"
export FILE_SIZE_LIMIT="${FILE_SIZE_LIMIT:-52428800}"
export STORAGE_BACKEND="${STORAGE_BACKEND:-file}"
export FILE_STORAGE_BACKEND_PATH="${FILE_STORAGE_BACKEND_PATH:-/var/lib/storage}"
export TENANT_ID="${TENANT_ID:-stub}"
export REGION="${REGION:-stub}"
export GLOBAL_S3_BUCKET="${GLOBAL_S3_BUCKET:-stub}"
export ENABLE_IMAGE_TRANSFORMATION="${ENABLE_IMAGE_TRANSFORMATION:-true}"
export IMGPROXY_URL="${IMGPROXY_URL:-http://imgproxy:5001}"

if [ -n "${SERVICE_ROLE_KEY}" ]; then
  export SERVICE_KEY="${SERVICE_ROLE_KEY}"
fi

if [ -n "${JWT_SECRET}" ]; then
  export PGRST_JWT_SECRET="${JWT_SECRET}"
fi

exec "${@}"