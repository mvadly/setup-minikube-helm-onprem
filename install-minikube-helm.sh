echo 'Installing Minikube...'
if [ ! -f ./minikube-linux-amd64 ]; then
    curl -LO https://storage.googleapis.com/minikube/releases/v1.25.2/minikube-linux-amd64
fi
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version
echo 'Install Minikube Done'

sleep 1
echo 'Starting Minikube with Podman Driver and Kubernetes v1.21.0...'
minikube start --driver podman --kubernetes-version 1.21.0
echo 'Enable Addon Ingress on Minikube'
minikube addons enable ingress

sleep 1
echo 'Installing Helm v2.17 ...'
if [ ! -f ./helm-v2.17.0-linux-amd64.tar.gz ]; then
    curl -LO https://get.helm.sh/helm-v2.17.0-linux-amd64.tar.gz
fi
tar -zxvf helm-v2.17.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helmv2
helmv2 version
echo 'Helm v2.17 Installed'

sleep 1
echo 'Installing Tiller for Helm v2.17...'
minikube kubectl -- -n kube-system create serviceaccount tiller
minikube kubectl -- create clusterrolebinding tiller \
  --clusterrole cluster-admin \
  --serviceaccount=kube-system:tiller
helmv2 init --service-account tiller
helmv2 version
echo 'Tiller for Helm v2.17 Installed'

sleep 1
echo 'Installing Helm v2.14 client for Supported Version On Premise...'
if [ ! -f ./helm-v2.14.0-linux-amd64.tar.gz ]; then
    curl -LO https://get.helm.sh/helm-v2.14.0-linux-amd64.tar.gz
fi
tar -zxvf helm-v2.14.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helmv2
helmv2 version
echo 'Helm v2.14 Installed'

