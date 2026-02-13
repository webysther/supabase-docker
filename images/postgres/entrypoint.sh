#!/usr/bin/env bash
set -e

export POSTGRES_PORT="${POSTGRES_PORT:-5432}"
if [ -n "${POSTGRES_PORT}" ]; then
  export PGPORT="${POSTGRES_PORT}"
fi

if [ -n "${POSTGRES_PASSWORD}" ]; then
  export PGPASSWORD="${POSTGRES_PASSWORD}"
fi

export POSTGRES_DB="${POSTGRES_DB:-postgres}"
if [ -n "${POSTGRES_DB}" ]; then
  export PGDATABASE="${POSTGRES_DB}"
fi

exec /usr/local/bin/docker-entrypoint.sh "$@"