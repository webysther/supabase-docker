FROM postgrest/postgrest:v14.3

ENV VERSION=14.3

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

CMD ["postgrest"]