#!/usr/bin/env bash

minikube start --vm-driver=none --extra-config=kubelet.authorization-mode=AlwaysAllow
sleep 5
kubectl create clusterrolebinding badboy --clusterrole cluster-admin --serviceaccount=default:default
echo "kubernetes initialized in insecure mode..."