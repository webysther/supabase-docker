#!/usr/bin/env bash
set -Eeuo pipefail

export PGRST_DB_URI="${PGRST_DB_URI:-postgres://authenticator:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}}"
export PGRST_DB_ANON_ROLE="${PGRST_DB_ANON_ROLE:-anon}"
export PGRST_DB_SCHEMAS="${PGRST_DB_SCHEMAS:-public,storage,graphql_public}"
export JWT_EXPIRY="${JWT_EXPIRY:-3600}"
export PGRST_DB_USE_LEGACY_GUCS="${PGRST_DB_USE_LEGACY_GUCS:-false}"

if [ -n "${JWT_SECRET:-}" ]; then
  export PGRST_JWT_SECRET="${JWT_SECRET}"
fi

if [ -n "${JWT_SECRET:-}" ]; then
  export PGRST_APP_SETTINGS_JWT_SECRET="${JWT_SECRET}"
fi

if [ -n "${JWT_EXPIRY:-}" ]; then
  export PGRST_APP_SETTINGS_JWT_EXP="${JWT_EXPIRY}"
fi

exec "${@}"