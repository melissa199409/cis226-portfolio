#!/bin/bash
if [ -f "$1" ]; then
	echo "File exists."
	exit 0
else
	echo "Error: File not found."
	exit 1 
fi
