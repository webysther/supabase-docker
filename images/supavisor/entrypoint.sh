#!/usr/bin/env bash
set -Eeuo pipefail

export DATABASE_URL="${DATABASE_URL:-ecto://supabase_admin:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/_supabase}"
export API_JWT_SECRET="${API_JWT_SECRET:-$JWT_SECRET}"
export METRICS_JWT_SECRET="${METRICS_JWT_SECRET:-$JWT_SECRET}"
export DB_POOL_SIZE="${DB_POOL_SIZE:-$POOLER_DB_POOL_SIZE}"

exec "${@}"