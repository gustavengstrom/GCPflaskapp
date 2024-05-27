FROM nginx:1.15.8
# Create directory for client_temp and set permissions
RUN mkdir -p /var/cache/nginx/client_temp \
    && chown -R nginx:nginx /var/cache/nginx
    
COPY index.html /usr/share/nginx/html