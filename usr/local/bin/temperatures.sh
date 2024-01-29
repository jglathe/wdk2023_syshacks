#!/bin/bash

# Run the sensors command and process the output
sensors | while IFS= read -r line
do
 # If the line starts with "Composite:", "temp", or "Sensor", extract the temperature
 if [[ "$line" == temp* ]]; then
    temp=$(echo "$line" | awk '{print $2}')
    echo -e "$device\t$temp"
 elif [[ "$line" == Sensor* ]]; then
    temp=$(echo "$line" | awk '{print $3}')
    echo -e "$device\t$temp"
 fi

 # If the line contains "Adapter:", store the previous line as the device name
 if echo "$line" | grep -q 'Adapter:'; then
    device=$(echo "$previous_line")
 fi

 # Store the current line as the previous line for the next iteration
 previous_line="$line"
done

