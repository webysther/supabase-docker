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

export DB_HOST="${DB_HOST:-$POSTGRES_HOST}"
export DB_PORT="${DB_PORT:-$POSTGRES_PORT}"
export DB_PASSWORD="${DB_PASSWORD:-$POSTGRES_PASSWORD}"
export DB_NAME="${DB_NAME:-$POSTGRES_DB}"

export API_JWT_SECRET="${API_JWT_SECRET:-$JWT_SECRET}"

exec "${@}"