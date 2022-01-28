#!/bin/bash
#
# A script that uses a newline separated list of domains
# to create full cert files for them from files located in
# /etc/letsencrypt/live
#
# It expects a directory in /etc/ssl/$domain to already exist
# The output will be in /etc/ssl/$domain/$domain.pem
#
# Upon creating the certs, this script will restart the HAProxy service
#
# author: danielpodwysocki (https://gitlab.com/danielpodwysocki)
# date: 2022-01

DOMAIN_LIST_FILE=/etc/certbot_domains

domains=$(cat $DOMAIN_LIST_FILE)

for domain in $domains
do
  if [ -d /etc/letsencrypt/live/$domain ] && [ -d /etc/ssl/$domain ]; then
    cat /etc/letsencrypt/live/$domain/fullchain.pem /etc/letsencrypt/live/$domain/privkey.pem > /etc/ssl/$domain/$domain.pem
    echo $domain
  fi
done


systemctl restart haproxy

