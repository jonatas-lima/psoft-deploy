#!/bin/bash

sudo apt update && sudo apt install -y wget curl

curl https://get.docker.com | bash

sudo usermod -aG docker $USER

APP_PATH=/home/ubuntu/app

mkdir $APP_PATH

mv /tmp/data.sql $APP_PATH
mv /tmp/db.env $APP_PATH
mv /tmp/stack.yml $APP_PATH
mv /tmp/backend.env $APP_PATH

sudo docker swarm init

sudo docker stack deploy -c $APP_PATH/stack.yml deploy

# timeout pro container subir
sleep 60

db_container_id=$(sudo docker ps | grep deploy_db | cut -d' ' -f1)

sudo docker exec -i $db_container_id psql -U tcc_match tcc_match < $APP_PATH/data.sql