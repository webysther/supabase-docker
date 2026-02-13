FROM supabase/logflare:1.30.3

ENV VERSION=1.30.3

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 \
  CMD curl http://localhost:4000/health

CMD ["sh", "run.sh"]