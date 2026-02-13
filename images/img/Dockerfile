FROM darthsim/imgproxy:v3.30.1

ENV VERSION=3.30.1

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

HEALTHCHECK --timeout=5s --interval=5s --retries=3 \
  CMD imgproxy health
