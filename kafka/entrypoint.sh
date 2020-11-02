#!/bin/bash

IP_ADDR=$(hostname -I | cut -d ' ' -f1) 
echo $IP_ADDR

/bin/sed -i 's/IP_ADDR/'''$IP_ADDR'''/g' /opt/kafka/config/server.properties

kafka-server-start.sh /opt/kafka/config/server.properties