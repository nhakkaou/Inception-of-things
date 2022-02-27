#!/bin/bash

echo "**** Begin installing k3s"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--bind-address=192.168.42.110  --node-ip=192.168.42.110  --tls-san $(hostname) --advertise-address=192.168.42.110" sh -

echo "Config Deployement k3s"
/usr/local/bin/kubectl  apply -f /vagrant_shared/app1/deployement.yaml
/usr/local/bin/kubectl  apply -f /vagrant_shared/app1/service.yaml
/usr/local/bin/kubectl  apply -f /vagrant_shared/app1/ingress.yaml

echo "Config app2 Deployement k3s"
/usr/local/bin/kubectl  apply -f /vagrant_shared/app2/deployement.yaml
/usr/local/bin/kubectl  apply -f /vagrant_shared/app2/service.yaml
/usr/local/bin/kubectl  apply -f /vagrant_shared/app2/ingress.yaml

echo "Config app3 Deployement k3s"
/usr/local/bin/kubectl  apply -f /vagrant_shared/app3/deployement.yaml
/usr/local/bin/kubectl  apply -f /vagrant_shared/app3/service.yaml
/usr/local/bin/kubectl  apply -f /vagrant_shared/app3/ingress.yaml
echo "**** End installing k3s"