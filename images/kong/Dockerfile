FROM kong:2.8.1

ENV VERSION=2.8.1

ADD https://raw.githubusercontent.com/supabase/supabase/cdc1a93eb06d8670a1ccea4ce800f2aba5e923d6/docker/volumes/api/kong.yml \
    /etc/kong/kong.yml

COPY --chmod=755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["bash", "-c", "custom-entrypoint.sh && docker-entrypoint.sh kong docker-start"]
