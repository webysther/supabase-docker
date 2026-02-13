# Supabase Docker

This repository make easy to deploy supabase with actions to build mostly services with all values pre-configured.

## Features

- Build the image for services default configuration with entrypoint and healthcheck
- Add files used in [setup](https://supabase.com/docs/guides/self-hosting/docker) in docker image
- Security batteries included:
  - All containers wrapper in a network

## Limitations

Focus in self-hosted base on good practices, some things are not supported:

- Skipped version with S3

## Setup

Let's generate the keys that will need:

```sh
docker run ghcr.io/webysther/supabase-keys
```

The expected output:

```yml
JWT_SECRET=2xxTbcyD1DC2P0muLBSr/MaJf+qqCIQTfwkKyIRA
POSTGRES_PASSWORD=4bbedaad7bdf3603669fe2bfef2214a7
ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzcwOTQ1MTE5LCJleHAiOjE5Mjg2MjUxMTl9.sQ9r35DyoUMy7LLaj8absea-G-nVIbbNSyBS4QD1juA
SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaXNzIjoic3VwYWJhc2UiLCJpYXQiOjE3NzA5NDUxMTksImV4cCI6MTkyODYyNTExOX0.T-LYNkVkbahedGcxo7JPB2Whz9c1OcgtOSPjHyzW194
PG_META_CRYPTO_KEY=NVNNESmpLfGiMga3cnUcOixeAbtqqEQt
DASHBOARD_PASSWORD=a7477fd90362075c31f33064baa1403a
```

## Fork

```sh
git clone --depth 1 https://github.com/supabase/supabase
cp -rf supabase/docker/docker-compose.yml src
cp -rf supabase/docker/.env src
cp -rf supabase/docker/volumes src
```