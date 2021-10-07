#! /bin/bash

set xe
WORKDIR=$(pwd)
CLUSTER_NAME="firefly"
REGISTRY_NAME="firefly"
REGISTRY_PORT="8081"
SERVER_COUNT=1
AGENT_COUNT=0

# TODO: add check for k3d. Must be 4.4.8 or better.
k3d registry create ${REGISTRY_NAME}.localhost -p ${REGISTRY_PORT} ;
k3d cluster create ${CLUSTER_NAME} \
  --servers ${SERVER_COUNT} \
  --agents ${AGENT_COUNT} \
  --kubeconfig-update-default=true \
  --registry-use k3d-${REGISTRY_NAME}.localhost:${REGISTRY_PORT} \
  --k3s-server-arg '--no-deploy=traefik' \

# TODO: add check for helm binary. Must be v3 or better.
echo "Installing firefly stack..."

helm install firefly ./helm/firefly

cd $WORKDIR
