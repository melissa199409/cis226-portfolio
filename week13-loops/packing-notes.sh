#!/bin/bash
# paking-notes.sh - print the packing note for every channel
set -euo pipefail
channels=(online shop market)
for channel in "${channels[@]}"; do
	echo "== $channel =="
	./channel-note.sh "$channel"
done
