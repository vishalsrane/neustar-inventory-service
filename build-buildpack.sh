#!/usr/bin/env bash

PREFIX=harbor.onedev.neustar.biz/cs-loms-nonprod
NAME=inventory-service:1
IMAGE_NAME=$PREFIX/$NAME


mvn -DskipTests clean package
#docker build -t $IMAGE_NAME .


pack config default-builder paketobuildpacks/builder:base
pack build $NAME --path .

#docker run -p 8080:8080 -e SERVER_PORT=8080 $IMAGE_NAME