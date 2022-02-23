#!/bin/bash

echo "**** Begin installing k3s"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_TOKEN="./token" sh -
echo "**** End installing k3s"