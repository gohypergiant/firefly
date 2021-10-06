#! /bin/bash

set xe

CLUSTER_NAME="hyperdrive"
REGISTRY_NAME="hyperdrive"
REGISTRY_PORT="8081"
SERVER_COUNT=1
AGENT_COUNT=0

k3d registry create ${REGISTRY_NAME}.localhost -p ${REGISTRY_PORT} ;
k3d cluster create ${CLUSTER_NAME} \
  --servers ${SERVER_COUNT} \
  --agents ${AGENT_COUNT} \
  --kubeconfig-update-default=true \
  --registry-use k3d-${REGISTRY_NAME}.localhost:${REGISTRY_PORT} \
  --k3s-server-arg '--no-deploy=traefik' \
