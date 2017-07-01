This repository will have some useful scripts and information that I use for visualizing the data from my Dionaea and Cowrie honeypots.

DionaeaFR Scripts
=================

dfr.sh
------
The file named dfr.sh is a script that was originally posted to my blog at http://www.executemalware.com by R1ckyz1 . I've made a few modifications and reposted it here. This script will install DionaeaFR and all of it's dependencies. It will take about an hour to complete.

After the script runs, you will have to edit the file /opt/DionaeaFR/DionaeaFR/settings.py and change the path to point to your SQLite database file.

At this point, you should be able to start DionaeaFR from the /opt/DionaeaFR folder. 
1. sudo mkdir /var/run/dionaeafr
2. sudo python manage.py collectstatic 
  (Answer yes when prompted)
3. sudo python manage.py runserver 0.0.0.0:8000 &

Now, open your browser and point it to localhost:8000

You should now see your Dionaea honeypot stats.

start_dfr.sh
------------
This script will run the above commands (create the pid, collectstatic and then start the server). The easiest way start DionaeaFR on a regular basis.

ELK Scripts
===========

create-cowrie-mapings.sh
------------------------
This script will create an Elasticsearch index named cowrie with 1 shard and 0 replicas. It also sets up mappings for the eventid and timestamp fields.

bulk_index.sh
-------------
This script uses the bulk API to prepend some information to each line in the Cowrie JSON file. Then it imports the data to the Cowrie Elasticsearch index. Assuming that you have multiple JSON files in a folder named cowrie, you can use the following command ijn a terminal window to loop through all of the JSON files in a folder and process them with the bulk_index.sh script:

for JSON in cowrie/*.*; do bulk_index.sh $JSON; done

