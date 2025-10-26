echo 'Stop Minikube...'
minikube stop

echo 'Delete Minikube...'
minikube delete

echo 'Delete Minikube Executable'
sudo rm /usr/local/bin/minikube

echo 'Remove Configuration and Cache files...'
rm -rf ~/.minikube ~/.kube

echo 'Delete All Podman Containers'
podman rm -f $(podman ps -a)
podman container prune

echo 'Delete All Podman Images'
podman image rm -f $(podman images -q)
podman image prune

echo 'Uninstall Podman'
sudo apt remove podman -y
sudo apt autoremove -y

echo 'Uninstall Helm'
sudo rm /usr/local/bin/helmv2
rm -rf ~/.cache/helm ~/.config/helm ~/.local/share/helm

