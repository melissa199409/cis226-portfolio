#!/bin/bash
if [ "$1" -ge "$2" ]; then
	echo "Stock is enough."
	exit 0
else
	echo "Error: Not enough stock."
	exit 1
fi
