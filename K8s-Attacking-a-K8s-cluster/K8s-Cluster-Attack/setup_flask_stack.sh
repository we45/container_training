#!/usr/bin/env bash
kubectl create configmap nginx-config --from-file=reverseproxy.conf
echo "Deploying Vul Flask Nginx Pod"
kubectl create -f ngflaskredis-deployment.yml
sleep 5
echo "Deploying Vul-Flask-Nginx Service"
kubectl create -f ngflask-redis-service.yml
kubectl create -f redis-service.yml