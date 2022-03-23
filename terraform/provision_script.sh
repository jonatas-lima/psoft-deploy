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