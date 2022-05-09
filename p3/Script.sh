# echo "Install Docker"
# if you already have a docker installation, you can skip this step
# sudo apt-get remove docker docker-engine docker.io containerd runc
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# # Use the following command to set up the stable repository
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "Install K3d"
sudo wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

echo "Install Kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo k3d cluster create mycluster -p 8080:80@loadbalancer -p 8888:8888@loadbalancer  --k3s-arg "--disable=traefik@server:0"

echo "Create Namesapces"
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

echo " Setup Argo CD "
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo " Waiting Argo CD Setup "
params="-n argocd -l app.kubernetes.io/name=argocd-server --timeout=10m"
sudo kubectl wait --for=condition=available deployment $params
sudo kubectl wait --for=condition=ready pod $params

echo "Config Argocd patched"
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

echo "Get Creditentials"
sudo kubectl get secret argocd-initial-admin-secret -n argocd -o yaml | grep password: | awk '{print $2}' | base64 --decode > password.txt

