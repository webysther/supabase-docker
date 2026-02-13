FROM kong:2.8.1

ENV VERSION=2.8.1

COPY ./kong.yml /home/kong/kong.yml

COPY --chmod=755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["bash", "-c", "/usr/local/bin/custom-entrypoint.sh && /docker-entrypoint.sh kong docker-start"]
