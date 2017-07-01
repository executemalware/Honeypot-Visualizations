#!/bin/bash

rm -rf /tmp/cowrieevents.json
echo -n "Indexing $1..."
while read LINE; do
    echo '{"index": {"_index":"cowrie","_type":"cowrieevents"}}' >> /tmp/cowrieevents.json
    echo $LINE >> /tmp/cowrieevents.json
done <"$1"
curl -s XPOST --data-binary @/tmp/cowrieevents.json localhost:9200/_bulk
rm /tmp/cowrieevents.json
