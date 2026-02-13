#!/usr/bin/env bash
set -Eeuo pipefail

export PG_META_DB_HOST="${PG_META_DB_HOST:-$POSTGRES_HOST}"
export PG_META_DB_PORT="${PG_META_DB_PORT:-$POSTGRES_PORT}"
export PG_META_DB_NAME="${PG_META_DB_NAME:-$POSTGRES_DB}"
export PG_META_DB_PASSWORD="${PG_META_DB_PASSWORD:-$POSTGRES_PASSWORD}"

export CRYPTO_KEY="${CRYPTO_KEY:-$PG_META_CRYPTO_KEY}"

exec docker-entrypoint.sh "${@}"