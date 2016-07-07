sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y postgresql postgresql-contrib
sudo apt-get install -y pgadmin3

curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get install oracle-java7-installer

wget -O /tmp/intellij.tar.gz https://download.jetbrains.com/idea/ideaIC-2016.1.3.tar.gz
tar xfz /tmp/intellij.tar.gz

cd ~/Desktop
touch intellij.desktop
echo "[Desktop Entry]
Version=1.0
Name=Intellij       
Comment=Open Idea Intellij
Exec=/home/vagrant/idea-IC-145.1617.8/bin/idea.sh 
Icon=/home/vagrant/idea-IC-145.1617.8/bin/idea.png
Terminal=false
Type=Application
Categories=Utility;Application;
Name[en_US]=IntelliJ" >> intellij.desktop
chmod +x ~/Desktop/intellij.desktop

touch pgadmin3.desktop
echo "[Desktop Entry]
Encoding=UTF-8
Name=pgAdmin III
Exec=/usr/bin/pgadmin3
Icon=/usr/share/app-install/icons/pgadmin3.svg
Type=Application
Categories=Application;Development;
MimeType=text/html
DocPath=/usr/share/pgadmin3/docs/en_US/index.html
Comment=PostgreSQL Tools" >> pgadmin3.desktop
chmod +x ~/Desktop/pgadmin3.desktop


sudo su postgres -c "psql -c \"CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'\" "
sudo su postgres -c "createdb -E UTF8 -T template0 --locale=en_US.utf8 -O vagrant quotes"

nvm install 4.4.5
git clone https://github.com/lewrang/aplikacja_mgr.git
cd aplikacja_mgr/
npm i