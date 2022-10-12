#!/usr/bin/env bash


PREFIX=harbor.onedev.neustar.biz/cs-loms-nonprod
NAME=inventory-service:1
IMAGE_NAME=$PREFIX/$NAME

NS=cscp-loms-nt-cmf-mesh
APP_NAME=inventory-service

mkdir -p k8s
kubectl get ns | grep $NS || kubectl create ns $NS
#kubectl get ns/$NS || kubectl create ns $NS -o yaml > k8s/ns.yaml


kubectl get -n $NS deployments/$APP_NAME || \
 kubectl -n $NS create deployment --image=$IMAGE_NAME $APP_NAME

kubectl -n $NS expose deployment $APP_NAME --port=8080

