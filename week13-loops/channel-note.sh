#!/bin/bash
# channel-note.sh - what to do with an order, by sales channel
channel="${1:-}"
case "$channel" in
	online)
	  echo "Pack it, print the label, and drop it at the post office."
	  ;;
        
          shop)
           echo "Ring it up at the counter and offer a bag."
	   ;;
   market)
	   echo "Take cash or card at the stall, and keep the receipt."
	   ;;
   "")
	   echo "Usage: ./channel-note.sh online|shop|market" >&2
	   exit 1
	   ;;
   *)
	   echo "Unknown channel: $channel" >&2
	   exit 2
	   ;;
esac
