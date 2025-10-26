# Install Podman and Minikube with Helm v2.14 and Tiller v2.17

## Install Podman
```
    sh ./install-podman.sh
```

## Install, Start, Add Ingress Minikube
```
    chmod +x install-minikube-helm.sh
    ./install-minikube-helm.sh --driver podman
```

## Running Kubernetes Dashboard
```
    minikube dashboard
```