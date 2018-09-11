#!/bin/bash

curl -XPUT 'localhost:9200/cowrie?pretty' -H 'Content-Type: application/json' -d'
{
  "settings": {
     "number_of_shards": 1, 
     "number_of_replicas": 0
     },
   "mappings": {
	"cowrieevents" : {
		"properties" : {
     		   	"eventid" : { "type" : "text" },
		   	"timestamp" : { 
				"type" : "date", 
				"format" : "date_time" 
               		},
               		"src_ip" : { "type" : "ip" }
		}
	}
    }
}
'
