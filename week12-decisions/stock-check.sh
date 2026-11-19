#!/bin/bash

# stock-check.sh - how many copies are on the shelf?

copies="${1:-0}"

if [[ $copies -eq 0 ]]; then
  echo "Out of stock. Reorder today."
elif [[ $copies -lt 5 ]]; then
  echo "Running low ($copies left). Reorder this week."
else
  echo "Plenty on the shelf ($copies)."
fi
