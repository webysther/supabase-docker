#!/usr/bin/env bash
set -Eeuo pipefail

if [ ! -d "/home/deno/functions/hello" ]; then
  cp -r /home/deno/functions-hello /home/deno/functions/hello
fi

export SUPABASE_DB_URL="${SUPABASE_DB_URL:-postgresql://postgres:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}}"

export SUPABASE_ANON_KEY="${SUPABASE_ANON_KEY:-$ANON_KEY}"
export SUPABASE_SERVICE_ROLE_KEY="${SUPABASE_SERVICE_ROLE_KEY:-$SERVICE_ROLE_KEY}"
export VERIFY_JWT="${VERIFY_JWT:-$FUNCTIONS_VERIFY_JWT}"

exec edge-runtime "${@}"