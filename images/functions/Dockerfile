FROM supabase/edge-runtime:v1.70.0

ENV VERSION=1.70.0

COPY ./scripts/main /home/deno/functions-main
COPY ./scripts/hello /home/deno/functions-hello

COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

CMD ["start", "--main-service", "/home/deno/functions-main"]
