#!/bin/bash

# Wait for hci0 to be up
while [[ ! -d "/sys/class/bluetooth/hci0" ]]; do
	sleep 1
done

#wait a few seconds more to be sure
sleep 5

# Now that hci0 is up, set the MAC address
/usr/bin/btmgmt public-addr AD:5A:00:F0:FD:8C

