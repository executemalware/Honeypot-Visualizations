This repository will have some useful scripts and information that I use for visualizing the data from my Dionaea and Cowrie honeypots.

The file named dfr.sh is a script that was originally posted to my blog at http://www.executemalware.com by R1ckyz1 . I've made a few modifications and reposted it here. This script will install DionaeaFR and all of it's dependencies. It will take about an hour to complete.

After the script runs, you will have to edit the file /opt/DionaeaFR/DionaeaFR/settings.py and change the path to the SQLite database file.

At this point, you should be able to start DionaeaFR from the /opt/DionaeaFR folder. 
1. sudo mkdir /var/run/dionaeafr
2. sudo python manage.py collectstatic 
  (Answer yes when prompted)
3. sudo python manage.py runserver 0.0.0.0:8000 &

Now, open your browser and point it to localhost:8000

You should now see your Dionaea honeypot stats.


