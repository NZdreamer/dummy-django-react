FROM nginx:1.18.0

# Install netcat
RUN apt-get update && \
    apt-get install -y netcat && \
    rm -rf /var/lib/apt/lists/*

COPY start-nginx.sh /start-nginx.sh
COPY default.conf /etc/nginx/conf.d

RUN chmod +x /start-nginx.sh
RUN rm /etc/nginx/conf.d/default.conf

CMD ["/start-nginx.sh"]


