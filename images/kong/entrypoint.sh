#!/usr/bin/env bash
set -Eeuo pipefail

export SUPABASE_ANON_KEY="${SUPABASE_ANON_KEY:-$ANON_KEY}"
export SUPABASE_SERVICE_KEY="${SUPABASE_SERVICE_KEY:-$SERVICE_ROLE_KEY}"

sed -i "s|\$SUPABASE_ANON_KEY|${SUPABASE_ANON_KEY}|g" /home/kong/kong.yml
sed -i "s|\$SUPABASE_SERVICE_KEY|${SUPABASE_SERVICE_KEY}|g" /home/kong/kong.yml

sed -i "s|\$DASHBOARD_USERNAME|${DASHBOARD_USERNAME}|g" /home/kong/kong.yml
sed -i "s|\$DASHBOARD_PASSWORD|${DASHBOARD_PASSWORD}|g" /home/kong/kong.yml