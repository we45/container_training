#!/usr/bin/env bash

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address $(curl -XGET https://www.canihazip.com/s)
mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
kubectl taint nodes --all node-role.kubernetes.io/master-
sleep 5
kubectl create clusterrolebinding badboy --clusterrole cluster-admin --serviceaccount=default:default
echo "kubernetes initialized in insecure mode..."
