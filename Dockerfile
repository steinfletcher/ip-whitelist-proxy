FROM nginx:1-alpine

RUN apk add --no-cache gettext bash
ADD nginx.conf /etc/nginx/nginx.conf
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
