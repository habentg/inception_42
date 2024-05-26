#!/bin/sh

chown -R $USER:$USER ./certs

cat ./certs/intro.txt

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout ./certs/hatesfam_pk.pem \
  -out ./certs/hatesfam_cert.crt \
  -subj "/C=AE/ST=AD/L=Abu Dhabi/O=42AD/CN=HTG_inception.com"