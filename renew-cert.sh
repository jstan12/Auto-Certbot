#!/bin/bash
source conf
leDir="/etc/letsencrypt/live/${SERVER_URL}"
homeDir="/home/${USER}"

ssh $USER@$SERVER_URL "[ "$(docker ps -a | grep access-gateway)" ] && docker stop access-gateway;certbot renew;sudo cp $leDir/privkey.pem $homeDir/privkey.pem;sudo cp $leDir/cert.pem $homeDir/cert.pem"
scp $USER@$SERVER_URL:$homeDir/\{cert.pem,privkey.pem} $DOWNLOAD
ssh $USER@$SERVER_URL "rm $homeDir/{cert.pem,privkey.pem};[ "$(docker ps -a | grep access-gateway)" ] && docker start access-gateway"
