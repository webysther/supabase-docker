#!/usr/bin/env bash
set -Eeuo pipefail

export KONG_DATABASE="${KONG_DATABASE:-off}"
export KONG_DECLARATIVE_CONFIG="${KONG_DECLARATIVE_CONFIG:-/home/kong/kong.yml}"
# https://github.com/supabase/cli/issues/14
export KONG_DNS_ORDER="${KONG_DNS_ORDER:-LAST,A,CNAME}"
export KONG_PLUGINS="${KONG_PLUGINS:-request-transformer,cors,key-auth,acl,basic-auth,request-termination,ip-restriction}"
export KONG_NGINX_PROXY_PROXY_BUFFER_SIZE="${KONG_NGINX_PROXY_PROXY_BUFFER_SIZE:-160k}"
export KONG_NGINX_PROXY_PROXY_BUFFERS="${KONG_NGINX_PROXY_PROXY_BUFFERS:-64 160k}"
export DASHBOARD_USERNAME="${DASHBOARD_USERNAME:-supabase}"

if [ -n "${ANON_KEY:-}" ]; then
  export SUPABASE_ANON_KEY="${ANON_KEY}"
fi

if [ -n "${SERVICE_ROLE_KEY:-}" ]; then
  export SUPABASE_SERVICE_KEY="${SERVICE_ROLE_KEY}"
fi