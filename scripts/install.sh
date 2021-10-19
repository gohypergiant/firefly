#! /bin/bash

echo "==> Updating list of repositories"
yum -y update

echo "==> Installing docker"
yum install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
yum -y update
yum -y install docker-ce docker-ce-cli containerd.io
usermod -aG docker ${SSH_USERNAME}

echo "==> Adding docker to systemd"
mv /tmp/docker.service /lib/systemd/system/docker.service
chmod 644 /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker

KUBE_VERSION=v1.22.0

echo "==> Installing kubectl $KUBE_VERSION"
cd /tmp
curl -LO "https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

HELM_VERSION=v3.7.0

echo "==> Installing helm $HELM_VERSION"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
DESIRED_VERSION=$HELM_VERSION ./get_helm.sh
helm version

echo "==> Install k3d"
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh
