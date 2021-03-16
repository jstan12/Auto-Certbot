#!/bin/bash
source conf
domain="${DOMAIN}"
leDir="/etc/letsencrypt/live/${DOMAIN}"
homeDir="/home/${USER}
mail="${MAIL}"

sudo apt update && sudo apt install letsencrypt software-properties-common -y
sudo certbot certonly --manual --preferred-challenges=dns --email $mail --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d $domain -d *.$domain
sudo cp $leDir/privkey.pem $homeDir/privkey.pem;sudo cp $leDir/cert.pem $homeDir/cert.pem
