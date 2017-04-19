#!/bin/sh

RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}Updating your System${NC}"
sudo apt-get update && sudo apt-get dist-upgrade -y

echo -e "${RED}Installing PIP${NC}"
sudo apt-get install build-essential -y

echo -e "${RED}Installing Python Dev${NC}"
sudo apt-get install python-dev -y

echo -e "${RED}Installing git${NC}"
sudo apt-get install git -y

echo -e "${RED}Installing PIP${NC}"
sudo apt-get install python-pip -y

echo -e "${RED}Installing PIP${NC}"
sudo apt-get install python-netaddr -y

echo -e "${RED}Installing Django and his freinds${NC}"
sudo pip install Django==1.6.5
sudo pip install pygeoip
sudo pip install django-pagination
sudo pip install django-tables2==1.0
sudo pip install django-compressor==1.4
sudo pip install django-htmlmin
sudo pip install django-filter==0.7
sudo pip install six==1.5.2

echo -e "${RED}Cloning Django-Tables2-simplerfilter${NC}"
cd /opt/
sudo wget https://github.com/benjiec/django-tables2-simplefilter/archive/master.zip -O django-tables2-simplefilter.zip
sudo unzip django-tables2-simplefilter.zip
sudo mv django-tables2-simplefilter-master/ django-tables2-simplefilter/
cd django-tables2-simplefilter
sudo python setup.py install

echo -e "${RED}Cloning SubnetTree${NC}"
cd /opt/
sudo git clone git://git.bro-ids.org/pysubnettree.git
cd pysubnettree
sudo python setup.py install

echo -e "${RED}Downloading and Installing NodeJS${NC}"
cd /opt/
sudo wget http://nodejs.org/dist/v4.7.1/node-v4.7.1.tar.gz
sudo tar xzvf node-v4.7.1.tar.gz;
cd node-v4.7.1
sudo ./configure
sudo make
sudo make install

echo -e "${RED}Installing promise and less${NC}"
sudo npm install -g promise
sudo npm install -g less

echo -e "${RED}Downloading and Installing DionaeaFR${NC}"
cd /opt/
sudo wget https://github.com/rubenespadas/DionaeaFR/archive/master.zip -O DionaeaFR.zip
sudo unzip DionaeaFR.zip
sudo mv DionaeaFR-master/ DionaeaFR

echo -e "${RED}Downloading and Installing Geo stuff${NC}"
cd /opt/
sudo wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
sudo wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
sudo gunzip GeoLiteCity.dat.gz
sudo gunzip GeoIP.dat.gz
sudo mv GeoIP.dat DionaeaFR/DionaeaFR/static
sudo mv GeoLiteCity.dat DionaeaFR/DionaeaFR/static

echo -e "${RED}Moving and editing Settings...${NC}"
sudo cp /opt/DionaeaFR/DionaeaFR/settings.py.dist /opt/DionaeaFR/DionaeaFR/settings.py
cd /opt/DionaeaFR/DionaeaFR
echo -e "${GREEN}Now just edit the file in this folder named settings.py and change sqlite DB location...${NC}"
