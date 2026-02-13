#!/usr/bin/bash

set -e

for d in $(find ./images -type f -name Dockerfile); do
  dir=$(dirname "$d")
  ver=$(sed -n 's/^ENV[[:space:]]\+VERSION[[:space:]]*=\s*//p' "$d" || echo "latest")
  docker build -t ghcr.io/webysther/supabase-${dir##*/}:${ver:-latest} "$dir"
  docker push ghcr.io/webysther/supabase-${dir##*/}:${ver:-latest}
done