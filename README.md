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

```dotenv
ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzcwOTUyNjc5LCJleHAiOjIwODYzMTI2Nzl9.reinpkIxiESzwDrkTfU5ykEdEWvTsYaLMTOgnt5Lol4
SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaXNzIjoic3VwYWJhc2UiLCJpYXQiOjE3NzA5NTI2NzksImV4cCI6MjA4NjMxMjY3OX0.JvhSw260wcBv96vgxf3gNQA8Pw_d0m8lpbK3zF9sWhQ

JWT_SECRET=6LK6kHagILe9iaD6XoZQ6+sYKHzWUu57aJcZ9jjp
SECRET_KEY_BASE=WPugZjoAHrsSDUklHQG5qTBLaTqdxJIljr/f/b6ioGFskUKTY22yjsfnWiM1Rz6m
VAULT_ENC_KEY=392d1482048c88336db1c32217e5bff1
PG_META_CRYPTO_KEY=ZVjcLxJj5BqcBf4Jz/c7Tw8lImH/LIvI
LOGFLARE_PUBLIC_ACCESS_TOKEN=PRaDduSgnfnciWHbF6Q3HdONtuQJ5mOI
LOGFLARE_PRIVATE_ACCESS_TOKEN=t1P0s0VB7bH9prYKwBhJOK80OtxK0q8G
S3_PROTOCOL_ACCESS_KEY_ID=0d7d5feb780a389895b39c66670fd2b4
S3_PROTOCOL_ACCESS_KEY_SECRET=485d38810b2c1cb09283853b9be5f4ce77b77dd5d06f7e549385b8f0da2c3854

POSTGRES_PASSWORD=f8c32be281e4e49e6d0d9294c898cf13
DASHBOARD_PASSWORD=b50851123375b3ff944630090195dbb6
```

Now just copy the result in bottom of docker-compose.yml

## Fork

```sh
git clone --depth 1 https://github.com/supabase/supabase
cp -rf supabase/docker/docker-compose.yml src
cp -rf supabase/docker/.env src
cp -rf supabase/docker/volumes src
```