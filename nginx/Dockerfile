FROM nginx:1.23.1

ENV NGINX_CONFIG_TEMPLATE_PATH=/etc/nginx/nginx.conf.template
ENV NGINX_CONFIG_PATH=/etc/nginx/nginx.conf
ENV DOLLAR=$

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]