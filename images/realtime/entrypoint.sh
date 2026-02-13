#!/usr/bin/env bash
set -Eeuo pipefail

export DB_HOST="${DB_HOST:-$POSTGRES_HOST}"
export DB_PORT="${DB_PORT:-$POSTGRES_PORT}"
export DB_PASSWORD="${DB_PASSWORD:-$POSTGRES_PASSWORD}"
export DB_NAME="${DB_NAME:-$POSTGRES_DB}"

export API_JWT_SECRET="${API_JWT_SECRET:-$JWT_SECRET}"

exec /usr/bin/tini -s -g -- /app/run.sh "${@}"
