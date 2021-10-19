#! /bin/bash

set xe
WORKDIR=$(pwd)
CLUSTER_NAME="firefly"
REGISTRY_NAME="firefly"
REGISTRY_PORT="8081"
SERVER_COUNT=1
AGENT_COUNT=0
FIREFLY_NAMESPACE="firefly"
KUBE_VERSION="v1.21.0"

# TODO: add check for k3d >= 5.0.0
# k3s version must be 1.21.4 or better to avoid local-path permissions bug
k3d registry create ${REGISTRY_NAME}.localhost -p ${REGISTRY_PORT} ;
k3d cluster create ${CLUSTER_NAME} \
  -p 8090:80@loadbalancer \
  --version ${KUBE_VERSION} \
  --servers ${SERVER_COUNT} \
  --agents ${AGENT_COUNT} \
  --kubeconfig-update-default=true \
  --registry-use k3d-${REGISTRY_NAME}.localhost:${REGISTRY_PORT} \
  --k3s-arg "--disable=traefik@server:0"

# TODO: add check for helm binary. Must be v3 or better.
echo "Installing firefly stack..."
kubectl create namespace ${FIREFLY_NAMESPACE}
helm install --namespace ${FIREFLY_NAMESPACE} firefly ./helm/firefly
cd $WORKDIR
