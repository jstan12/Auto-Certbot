#!/bin/bash
source conf
leDir="/etc/letsencrypt/live/${DAG_URL}"
homeDir="/home/${USER}"

ssh $USER@$DAG_URL "sudo apt install software-properties-common | sudo add-apt-repository ppa:certbot/cerbot | sudo apt update | sudo apt install cerbot -y | sudo certbot certonly --standalone --agree-tos -m null --no-eff-email --no-bootstrap --manual-public-ip-logging-ok --preferred-challenges http -d $DAG_URL | echo "Certbot running..." | sleep 60 | sudo cp $leDir/privkey.pem $homeDir/privkey.pem | sudo cp $leDir/cert.pem $homeDir/cert.pem"

scp $USER@$DAG_URL:$homeDir/\{cert.pem,privkey.pem} $DOWNLOAD
ssh $USER@$DAG_URL "rm $homeDir/{cert.pem,privkey.pem} | docker start access-gateway"
