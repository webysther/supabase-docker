#!/usr/bin/env bash
set -e

export POSTGRES_PORT="${POSTGRES_PORT:-5432}"
export POSTGRES_DB="${POSTGRES_DB:-postgres}"
export JWT_EXPIRY="${JWT_EXPIRY:-3600}"

if [ -n "${POSTGRES_PORT}" ]; then
  export PGPORT="${POSTGRES_PORT}"
fi

if [ -n "${POSTGRES_PASSWORD}" ]; then
  export PGPASSWORD="${POSTGRES_PASSWORD}"
fi

if [ -n "${POSTGRES_DB}" ]; then
  export PGDATABASE="${POSTGRES_DB}"
fi

if [ -n "${JWT_EXPIRY}" ]; then
  export JWT_EXP="${JWT_EXPIRY}"
fi

exec /usr/local/bin/docker-entrypoint.sh "$@"