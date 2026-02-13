FROM supabase/studio:2026.01.27-sha-6aa59ff

COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

HEALTHCHECK --start-period=10s --interval=10s --timeout=10s --retries=10 \
    CMD "node -e \"fetch('http://studio:3000/api/platform/profile').then((r) => {if (r.status !== 200) throw new Error(r.status)})\""

CMD ["node", "apps/studio/server.js"]