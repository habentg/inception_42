#!/bin/sh

SECRETS_DIR=../../../../secrets

# cat "${SECRETS_DIR}/intro.txt"

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout ${SECRETS_DIR}/hatesfam_pk.pem \
  -out ${SECRETS_DIR}/hatesfam_cert.crt \
  -subj "/C=AE/ST=AD/L=Abu Dhabi/O=42AD/CN=hatesfam.42.fr"