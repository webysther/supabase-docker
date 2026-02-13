# Supabase Docker

This repository make easy to deploy supabase with actions to build the services with all values pre-configured.

## Major problems fixed

- Variables interporlation, lots of it
- All using entrypoint and healthcheck
- Add files used in [setup](https://supabase.com/docs/guides/self-hosting/docker) in docker image
- Security:
  - All containers wrapper in internal network
  - Variables isolated if not used in more than container
- No need to clone repository
- No need to copy files

## Limitations

- Skipped version with S3
- Skipped all other cloud features (GCP-ish, AWS-ish)
- Only variables not commented by default

## Setup

### Compose

To deploy only the `docker-compose.yml` and `.env` is necessary.

Let's generate the keys that will need:

```sh
docker run ghcr.io/webysther/supabase-keys
```

The expected output:

```dotenv
ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzcwOTk0NDEzLCJleHAiOjIwODYzNTQ0MTN9.9jkydPQ0g8YnwPAz2oixu1mKbtI01cPB3VK58Habi3g
SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaXNzIjoic3VwYWJhc2UiLCJpYXQiOjE3NzA5OTQ0MTMsImV4cCI6MjA4NjM1NDQxM30.I1eFwQoeNXNu4iqYiFyTmm_l2nVyj4JT4m2-9dO02Vw

JWT_SECRET=AFEIXyUU889o/SSRuwNgcUck9oqf+7nmouw+bieU
SECRET_KEY_BASE=HtwfNG7wM8B08KCDwQ3oPnFtr1us0jM83vmSYDyIU2gGhn7uOoPgzr+q90xZhTdV
VAULT_ENC_KEY=8e4db5495998f13f69057403f65e0746
PG_META_CRYPTO_KEY=zIKlK0K1O6Wid0/WD5aRSoCdrRkj04s1
LOGFLARE_PUBLIC_ACCESS_TOKEN=gbgsCqL7IrsmMlqwJqerWSUuVv+mKmVX
LOGFLARE_PRIVATE_ACCESS_TOKEN=S3ZRbCRL0SkUGdqlJF1nF9gQUWyH+14V
POOLER_TENANT_ID=5c9dadc3759f87bd
DB_ENC_KEY=ff4095bf08ac5244899b38aff1350fdf

POSTGRES_PASSWORD=5d4a981d933446a83a338b81ebadbefe
DASHBOARD_PASSWORD=0881e0ecaa127ec5a65004e9d2d0252b
```

Add to `.env` file and deploy:

```
docker compose up
```

Remove all: 

```
docker compose down -v
```

### Portainer

Change the `x-common` to point to `.env` style of portainer and you are good to go.

### Reverse proxy

Above the table of ports:

| Port | Service |
|------|----------|
| 5432 | Pooler |
| 6543 | Pooler |
| 4000 | Analytics |
| 8000 | API Gateway (http) |
| 8443 | API Gateway (https) |

### Volumes

Only the `db-config` is necessary to be named volume.
Volumes are used to speedup the test.

### Debug

If a specific service fail, run only this service (eg. vector):

```sh
./build.sh vector --test
```

### Optimizations

- Merge some images in just one
- Maybe build an AIO image

## Contribution

If this project was useful, consider donation and give a star.