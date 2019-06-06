#!/bin/bash
source conf
leDir="/etc/letsencrypt/live/${DAG_URL}"
homeDir="/home/${USER}"

ssh -t $USER@$DAG_URL "docker stop access-gateway | certbot renew | echo "Certbot running..." | sleep 60 | sudo cp $leDir/privkey.pem $homeDir/privkey.pem | sudo cp $leDir/cert.pem $homeDir/cert.pem"
scp $USER@$DAG_URL:$homeDir/\{cert.pem,privkey.pem} $DOWNLOAD
ssh $USER@$DAG_URL "rm $homeDir/cert.pem $homeDir/privkey.pem | docker start access-gateway"
