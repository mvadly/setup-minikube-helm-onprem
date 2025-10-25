echo 'Installing Podman...'
sudo apt update && sudo apt install podman -y
echo 'Podman installed'
echo 'Podman Mounting Reshared'
sudo mount --make-rshared /
echo 'mvadly ALL=(ALL) NOPASSWD: /usr/bin/podman' | sudo EDITOR='tee -a' visudo
