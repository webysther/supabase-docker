#!/usr/bin/env bash
set -Eeuo pipefail

if [ ! -d "/home/deno/functions/hello" ]; then
  cp -r /home/deno/functions-hello /home/deno/functions/hello
fi

export SUPABASE_URL="${SUPABASE_URL:-http://kong:8000}"
export SUPABASE_DB_URL="${SUPABASE_DB_URL:-postgresql://postgres:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}}"
export FUNCTIONS_VERIFY_JWT="${FUNCTIONS_VERIFY_JWT:-false}"

if [ -n "${ANON_KEY:-}" ]; then
  export SUPABASE_ANON_KEY="${ANON_KEY}"
fi

if [ -n "${SERVICE_ROLE_KEY:-}" ]; then
  export SUPABASE_SERVICE_ROLE_KEY="${SERVICE_ROLE_KEY}"
fi

if [ -n "${FUNCTIONS_VERIFY_JWT:-}" ]; then
  export VERIFY_JWT="${FUNCTIONS_VERIFY_JWT}"
fi

exec "${@}"