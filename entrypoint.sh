#!/bin/bash

set -e

[ -z "$ALLOWED_IPS" ] && echo "ALLOWED_IPS is not set. Aborting" && exit 1;
[ -z "$PROXY_TARGET" ] && echo "PROXY_TARGET is not set. Aborting" && exit 1;

export NAMESERVERS=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' ')

envsubst \
'$NAMESERVERS' \
    < /etc/nginx/nginx.conf > /tmp/nginx.conf

mv -f /tmp/nginx.conf /etc/nginx/nginx.conf

sed -i "s|__proxy_target__|${PROXY_TARGET}|g" /etc/nginx/nginx.conf

mkdir -p /etc/nginx/includes
for i in $(echo ${ALLOWED_IPS} | tr "," "\n")
do
  echo allow $i\; >> /etc/nginx/includes/allowed-ips
done

if [ "$#" -eq 0 ]; then
    exec nginx
else
    exec "$@"
fi
