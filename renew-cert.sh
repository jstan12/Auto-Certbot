#!/bin/bash
source conf
leDir="/etc/letsencrypt/live/${DAG_URL}"
homeDir="/home/${USER}"

ssh -t $USER@$DAG_URL "[ "$(docker ps -a | grep access-gateway)" ] && docker stop access-gateway;certbot renew;sudo cp $leDir/privkey.pem $homeDir/privkey.pem;sudo cp $leDir/cert.pem $homeDir/cert.pem"
scp $USER@$DAG_URL:$homeDir/\{cert.pem,privkey.pem} $DOWNLOAD
ssh $USER@$DAG_URL "rm $homeDir/{cert.pem,privkey.pem};[ "$(docker ps -a | grep access-gateway)" ] && docker start access-gateway"
