#!/bin/sh

set -xe
#Setup cluster
kind create cluster --config=kindconfig.yaml
kubectl cluster-info --context kind-test-cluster

#install tekton on cluster

kubectl apply --filename \
https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
