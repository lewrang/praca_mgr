sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y git

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get install oracle-java7-installer

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins

sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo deb https://apt.dockerproject.org/repo ubuntu-trusty main >> /etc/apt/sources.list.d/docker.list'
sudo apt-get -y update
sudo apt-get -y purge lxc-docker
apt-cache policy docker-engine
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y docker-engine

sudo service docker start
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo usermod -aG docker jenkins
sudo docker run --name db -e POSTGRES_PASSWORD=lewrang -e POSTGRES_USER=lewrang -e POSTGRES_DB=quotes -d postgres

sudo reboot