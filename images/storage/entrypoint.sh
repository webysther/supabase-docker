#!/usr/bin/env bash
set -Eeuo pipefail

export DATABASE_URL="${DATABASE_URL:-postgres://supabase_storage_admin:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}}"
export SERVICE_KEY="${SERVICE_KEY:-$SERVICE_ROLE_KEY}"
export PGRST_JWT_SECRET="${PGRST_JWT_SECRET:-$JWT_SECRET}"

exec docker-entrypoint.sh "${@}"