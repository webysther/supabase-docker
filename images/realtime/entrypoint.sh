#!/usr/bin/env bash
set -Eeuo pipefail

export PORT="${PORT:-4000}"
export DB_USER="${DB_USER:-supabase_admin}"
export DB_AFTER_CONNECT_QUERY="${DB_AFTER_CONNECT_QUERY:-SET search_path TO _realtime}"
export DB_ENC_KEY="${DB_ENC_KEY:-supabaserealtime}"
export ERL_AFLAGS="${ERL_AFLAGS:--proto_dist inet_tcp}"
export DNS_NODES="${DNS_NODES:-''}"
export RLIMIT_NOFILE="${RLIMIT_NOFILE:-10000}"
export APP_NAME="${APP_NAME:-realtime}"
export SEED_SELF_HOST="${SEED_SELF_HOST:-true}"
export RUN_JANITOR="${RUN_JANITOR:-true}"
export DISABLE_HEALTHCHECK_LOGGING="${DISABLE_HEALTHCHECK_LOGGING:-true}"

if [ -n "${POSTGRES_HOST:-}" ]; then
  export DB_HOST="${POSTGRES_HOST}"
fi

if [ -n "${POSTGRES_PORT:-}" ]; then
  export DB_PORT="${POSTGRES_PORT}"
fi

if [ -n "${POSTGRES_PASSWORD:-}" ]; then
  export DB_PASSWORD="${POSTGRES_PASSWORD}"
fi

if [ -n "${POSTGRES_DB:-}" ]; then
  export DB_NAME="${POSTGRES_DB}"
fi

if [ -n "${JWT_SECRET:-}" ]; then
  export API_JWT_SECRET="${JWT_SECRET}"
fi

exec "${@}"