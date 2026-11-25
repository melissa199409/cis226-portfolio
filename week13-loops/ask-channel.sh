#!/bin/bash
# ask-channel.sh - keep asking until we get a real channel
set -euo pipefail
read -r -p "Which channel (online/shop/market)? " channel
until ./channel-note.sh "$channel" 2>/dev/null; do
	echo "Hmm, '$channel' is not a channel. Try again."
	read -r -p "Which channel (online/shop/market)? " channel 
done
