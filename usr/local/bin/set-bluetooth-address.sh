#!/bin/bash

# Wait for hci0 to be up
counter=0
while [[ ! -d "/sys/class/bluetooth/hci0" ]] && [[ $counter -lt 120 ]]; do
        sleep 5
        let counter=counter+5
done

if [[ $counter -eq 120 ]]; then
        echo "Error: Device not found within the specified time limit"
        exit 1
fi

# Now that hci0 is up, set the MAC address
/usr/bin/btmgmt public-addr AD:5A:00:F0:FD:8C > /tmp/btmgmt.log 2>&1
if [ $? -ne 0 ]; then
  echo "btmgmt command failed" >&2
  cat /tmp/btmgmt.log >&2
  exit 1
fi
