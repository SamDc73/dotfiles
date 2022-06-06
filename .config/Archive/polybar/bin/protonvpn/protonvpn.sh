#!/bin/bash

VPNSTATUS=$(protonvpn-cli s)

function is_connected {
	echo $VPNSTATUS | wc -l
}


if [ "$(protonvpn-cli s | grep -i "server" | wc -l)" -gt 0 ]; then
	echo "%{F#149414}"
else
	echo "%{F#f00}"
fi
