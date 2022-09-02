#!/bin/bash

envsubst < $NGINX_CONFIG_TEMPLATE_PATH > $NGINX_CONFIG_PATH

IFS="," read -a whitelist <<< $IP_WHITELIST

for ip in "${whitelist[@]}"
do
  echo "$(sed 's|${IP_WHITELIST}|'$ip' 0;'\\n\\t\${IP_WHITELIST}'|g' $NGINX_CONFIG_PATH)" > $NGINX_CONFIG_PATH
done

echo "$(sed 's|${IP_WHITELIST}|default 1;|g' $NGINX_CONFIG_PATH)" > $NGINX_CONFIG_PATH

nginx -g 'daemon off;'