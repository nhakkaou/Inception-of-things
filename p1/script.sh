echo "******* Begin installing k3s *********"
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --bind-address=192.168.42.110  --node-ip=192.168.42.110   --advertise-address=192.168.42.110"
curl -sfL https://get.k3s.io | sh -
sudo cp /var/lib/rancher/k3s/server/token /vagrant_shared/
echo "********end*******"