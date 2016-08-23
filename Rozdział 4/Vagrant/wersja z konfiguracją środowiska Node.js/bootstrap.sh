sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y postgresql postgresql-contrib

curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile
nvm install 4.4.5

sudo su postgres -c "psql -c \"CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'\" "
sudo su postgres -c "createdb -E UTF8 -T template0 --locale=en_US.utf8 -O vagrant quotes"

git clone https://github.com/lewrang/aplikacja_mgr.git
cd aplikacja_mgr/
npm i

node server.js