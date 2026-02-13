FROM supabase/gotrue:v2.185.0

ENV VERSION=2.185.0

ENV GOTRUE_API_HOST=0.0.0.0
ENV GOTRUE_API_PORT=9999
ENV GOTRUE_DB_DRIVER=postgres

ENV GOTRUE_JWT_ADMIN_ROLES=service_role
ENV GOTRUE_JWT_AUD=authenticated
ENV GOTRUE_JWT_DEFAULT_GROUP_NAME=authenticated

ENV JWT_EXPIRY=3600
ENV SITE_URL="http://localhost:3000"
ENV ADDITIONAL_REDIRECT_URLS=
ENV DISABLE_SIGNUP=false
ENV DISABLE_SIGNUP=false
ENV API_EXTERNAL_URL="http://localhost:8000"

ENV MAILER_URLPATHS_CONFIRMATION="/auth/v1/verify"
ENV MAILER_URLPATHS_INVITE="/auth/v1/verify"
ENV MAILER_URLPATHS_RECOVERY="/auth/v1/verify"
ENV MAILER_URLPATHS_EMAIL_CHANGE="/auth/v1/verify"

ENV ENABLE_EMAIL_SIGNUP=true

ENV ENABLE_EMAIL_AUTOCONFIRM=false
ENV SMTP_ADMIN_EMAIL=admin@example.com

ENV SMTP_HOST=supabase-mail
ENV SMTP_PORT=2500
ENV SMTP_USER=fake_mail_user
ENV SMTP_PASS=fake_mail_password

ENV SMTP_SENDER_NAME=fake_sender
ENV ENABLE_ANONYMOUS_USERS=false

ENV ENABLE_PHONE_SIGNUP=true
ENV ENABLE_PHONE_AUTOCONFIRM=true

COPY --chmod=755 entrypoint.sh /usr/local/bin/custom-entrypoint.sh

ENTRYPOINT ["custom-entrypoint.sh"]

HEALTHCHECK --timeout=10s --interval=10s --retries=10 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:9999/health || exit 1

CMD ["auth"]
