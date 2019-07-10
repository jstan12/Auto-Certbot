#!/bin/bash
source conf
leDir="/etc/letsencrypt/live/${SERVER_URL}"
homeDir="/home/${USER}"

ssh $USER@$SERVER_URL "[ "$(docker ps -a | grep access-gateway)" ] && docker stop access-gateway;sudo apt-get install software-properties-common;sudo add-apt-repository ppa:certbot/certbot;sudo apt-get update;sudo apt install certbot -y;sudo certbot certonly --standalone --agree-tos --register-unsafely-without-email --no-eff-email --no-bootstrap --manual-public-ip-logging-ok --preferred-challenges http -d $SERVER_URL;sudo cp $leDir/privkey.pem $homeDir/privkey.pem;sudo cp $leDir/cert.pem $homeDir/cert.pem"
scp $USER@$SERVER_URL:$homeDir/\{cert.pem,privkey.pem} $DOWNLOAD
ssh $USER@$SERVER_URL "rm $homeDir/{cert.pem,privkey.pem};[ "$(docker ps -a | grep access-gateway)" ] && docker start access-gateway"
