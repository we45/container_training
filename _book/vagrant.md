apt-get update

apt-get install -y vim curl wget htop lxc 

curl -fsSL get.docker.com -o get-docker.sh

chmod +x get-docker.sh

sh get-docker.sh

sudo usermod -aG docker $USER