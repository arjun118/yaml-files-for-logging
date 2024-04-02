#!/bin/bash

# minikube start --memory 7192 --cpus 3

kubectl create ns logging
kubectl create configmap fluentd-configmap --from-file=./configmaps/configmap-fluentd --namespace logging
kubectl apply -f elastic.yaml -n logging
kubectl apply -f  kibana.yaml -n logging

kubectl apply -f fluentd-rbac.yaml
kubectl apply -f fluentd-daemonset.yaml

