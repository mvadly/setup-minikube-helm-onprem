echo 'Update & Upgrade...'
sudo apt update && sudo apt upgrade
echo 'Adding the official Docker CLI repository'
sudo apt -y install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo 'Installing Docker CLI'
sudo apt update && sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
docker --version
docker-compose --version

echo 'Setup Run Docker Without Root User'
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
