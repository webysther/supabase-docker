FROM kong:2.8.1

ENV VERSION=2.8.1

ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG="/home/kong/kong.yml"

ENV KONG_DNS_ORDER=LAST,A,CNAME
ENV KONG_PLUGINS=request-transformer,cors,key-auth,acl,basic-auth,request-termination,ip-restriction
ENV KONG_NGINX_PROXY_PROXY_BUFFER_SIZE=160k
ENV KONG_NGINX_PROXY_PROXY_BUFFERS="64 160k"
ENV DASHBOARD_USERNAME=supabase

ADD --chmod=644 https://raw.githubusercontent.com/supabase/supabase/cdc1a93eb06d8670a1ccea4ce800f2aba5e923d6/docker/volumes/api/kong.yml \
    /home/kong/kong.yml

COPY --chmod=755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["bash", "-c", "custom-entrypoint.sh && /docker-entrypoint.sh kong docker-start"]