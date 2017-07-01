sudo mkdir /var/run/dionaeafr
cd /opt/DionaeaFR
sudo python manage.py collectstatic
sudo python manage.py runserver 0.0.0.0:8000 &