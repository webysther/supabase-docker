#!/usr/bin/env bash
set -Eeo pipefail

export POSTGRES_HOST="/var/run/postgresql"
export PGPORT="${PGPORT:-$POSTGRES_PORT}"
export PGPASSWORD="${PGPASSWORD:-$POSTGRES_PASSWORD}"
export PGDATABASE="${PGDATABASE:-$POSTGRES_DB}"
export JWT_EXP="${JWT_EXP:-$JWT_EXPIRY}"

exec docker-entrypoint.sh "$@"