#!/bin/bash

INBOUND=eth1

sudo ethtool -K $INBOUND gro off

sudo rm -f /usr/local/var/run/suricata.pid
sudo rm -rf /usr/local/var/log/suricata/*

if [ -z $1 ]; then
	sudo suricata -c /usr/local/etc/suricata/suricata-ids.yaml --af-packet -D
else
	sudo suricata -c /usr/local/etc/suricata/suricata-ids.yaml --af-packet
fi
