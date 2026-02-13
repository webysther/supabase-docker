FROM supabase/edge-runtime:v1.70.0

ENV VERSION=1.70.0

COPY ./scripts/main /home/deno/functions-main
COPY ./scripts/hello /home/deno/functions-hello

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

CMD ["start", "--main-service", "/home/deno/functions-main"]
