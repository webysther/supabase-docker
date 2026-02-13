#!/usr/bin/env bash
set -Eeuo pipefail

export PORT="${PORT:-4000}"
export DATABASE_URL="${DATABASE_URL:-ecto://supabase_admin:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/_supabase}"
export CLUSTER_POSTGRES="${CLUSTER_POSTGRES:-true}"
export REGION="${REGION:-local}"
export ERL_AFLAGS="${ERL_AFLAGS:--proto_dist inet_tcp}"
export POOLER_POOL_MODE="${POOLER_POOL_MODE:-transaction}"
export POOLER_POOL_MODE="${POOLER_POOL_MODE:-transaction}"
export POOLER_DEFAULT_POOL_SIZE="${POOLER_DEFAULT_POOL_SIZE:-20}"
export POOLER_MAX_CLIENT_CONN="${POOLER_MAX_CLIENT_CONN:-100}"
export POOLER_DB_POOL_SIZE="${POOLER_DB_POOL_SIZE:-5}"

if [ -n "${JWT_SECRET:-}" ]; then
  export API_JWT_SECRET="${JWT_SECRET}"
fi

if [ -n "${JWT_SECRET:-}" ]; then
  export METRICS_JWT_SECRET="${JWT_SECRET}"
fi

if [ -n "${POOLER_DB_POOL_SIZE:-}" ]; then
  export DB_POOL_SIZE="${POOLER_DB_POOL_SIZE}"
fi

exec "${@}"