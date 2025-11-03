# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl status docker
sudo systemctl start docker
docker ps
sudo docker ps
sudo apt-get update
sudo apt-get install docker-compose-plugin
docker compose versionsudo apt-get update
sudo apt-get install docker-compose-plugin
docker compose version
sudo apt update
sudo apt upgrade -y
ls
git clone https://github.com/CTFd/CTFd.git
ls
head -c 64 /dev/urandom > .ctfd_secret_key
export SECRET_KEY=$(cat .ctfd_secret_key | base64)
cd CTFd
ls
vi docker-compose.yml 
docker-compose up
docker compose up
sudo docker compose up
