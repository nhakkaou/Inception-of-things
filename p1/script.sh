#!/bin/bash

echo "**** Begin installing k3s"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--advertise-address=192.168.42.110" sh -
cp /var/lib/rancher/k3s/server/token /vagrant_shared
echo "**** End installing k3s"