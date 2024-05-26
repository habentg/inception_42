# alpine base image: pre-built light-weight linux distro, will provide us with a small sized and secure linux invironment.
FROM alpine:3.18

# update and upgrade package repo. then installing nginx and openssl
RUN apk update && apk upgrade && \
  apk add nginx openssl && \
  rm -rf /var/lib/apt/lists/*

# creating necessary directories:
# /etc/nginx - will hold the configuration files
# /run/nginx - will hold the runtime files
# /usr/share/nginx/html - will hold static html files
RUN mkdir -p /etc/nginx /run/nginx /usr/share/nginx/html /etc/nginx/certs 

# copying our modified configuration file to the conf dir
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# making our nginx container reachable by other containers
EXPOSE 443

# changing ownership of these directory to the nginx user
RUN chown -R nginx:nginx /usr/share/nginx/html && \
  chown -R nginx:nginx /etc/nginx/certs/

# CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]