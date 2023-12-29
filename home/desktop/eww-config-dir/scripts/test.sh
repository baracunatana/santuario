#!/bin/sh
connection_uuid=$(nmcli -t -f UUID,DEVICE connection show --active | cut -d: -f1)

# Get the signal quality
signal_quality=$(nmcli -t -f SIGNAL connection show "$connection_uuid")

# Print the result
echo "Signal Quality: $signal_quality%"
