FROM darthsim/imgproxy:v3.30.1

ENV VERSION=3.30.1

COPY --chmod=0755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 \
  CMD imgproxy health

CMD ["imgproxy"]