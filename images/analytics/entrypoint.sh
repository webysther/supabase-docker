#!/usr/bin/env bash
set -Eeuo pipefail

export LOGFLARE_NODE_HOST="${LOGFLARE_NODE_HOST:-127.0.0.1}"
export DB_USERNAME="${DB_USERNAME:-supabase_admin}"
export DB_DATABASE="${DB_DATABASE:-_supabase}"
export DB_SCHEMA="${DB_SCHEMA:-_analytics}"
export POSTGRES_BACKEND_SCHEMA="${POSTGRES_BACKEND_SCHEMA:-_analytics}"
export POSTGRES_BACKEND_URL="${POSTGRES_BACKEND_URL:-postgresql://supabase_admin:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/_supabase}"
export LOGFLARE_SINGLE_TENANT="${LOGFLARE_SINGLE_TENANT:-true}"
export LOGFLARE_SUPABASE_MODE="${LOGFLARE_SUPABASE_MODE:-true}"
export LOGFLARE_FEATURE_FLAG_OVERRIDE="${LOGFLARE_FEATURE_FLAG_OVERRIDE:-multibackend=true}"

if [ -n "${POSTGRES_HOST}" ]; then
  export DB_HOSTNAME="${POSTGRES_HOST}"
fi

if [ -n "${POSTGRES_PORT}" ]; then
  export DB_PORT="${POSTGRES_PORT}"
fi

if [ -n "${POSTGRES_PASSWORD}" ]; then
  export DB_PASSWORD="${POSTGRES_PASSWORD}"
fi

exec "${@}"