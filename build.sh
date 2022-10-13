#!/usr/bin/env bash

#PREFIX=harbor.onedev.neustar.biz/cs-loms-nonprod
PREFIX=registry.digitalocean.com/neustar
NAME=inventory-service
IMAGE_NAME=$PREFIX/$NAME


mvn -DskipTests clean package

#docker login harbor.onedev.neustar.biz OR docker login harbor.onedev.neustar.biz -u $robo-username -p $robo-user-token
docker login registry.digitalocean.com -u $CONTAINER_REGISTRY_API_TOKEN -p $CONTAINER_REGISTRY_API_TOKEN

docker build -t $NAME .
docker tag $NAME $IMAGE_NAME

echo $IMAGE_NAME
docker push $IMAGE_NAME

#docker run -p 8080:8080 -e SERVER_PORT=8080 $IMAGE_NAME