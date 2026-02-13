FROM supabase/edge-runtime:v1.70.0

ENV VERSION=1.70.0

ENV SUPABASE_URL="http://kong:8000"
ENV FUNCTIONS_VERIFY_JWT=false

COPY ./scripts/main /home/deno/functions-main
COPY ./scripts/hello /home/deno/functions-hello

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

CMD ["start", "--main-service", "/home/deno/functions-main"]
