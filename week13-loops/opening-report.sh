#!/bin/bash
# opening-report.sh - Driftwood Books morning report
# Usage: ./opening-report.sh [sales-file]
# Author: Cecilia
sales_file="${1:-sales.csv}"
read -r -p "Who is opening the shop? " opener
if [[ ! -f "$sales_file" ]]; then
	echo "Error: '$sales_file' not found." >&2
	exit 2
fi
sales=$(awk -F, 'NR>1 {count++} END {print count+0}' "$sales_file")
if [[ "$sales" -eq 0 ]]; then
	echo "Error: '$sales_file' has no sales rows." >&2
        exit 2
fi
books=$(awk -F, 'NR>1 {b+=$3} END {print b}' "$sales_file")
revenue=$(awk -F, 'NR>1 {t+=$3*$4} END {printf "%.2f", t}' "$sales_file")
online=$(awk -F, 'NR>1 && $5=="online" {t+=$3*$4} END {printf "%.2f", t}' "$sales_file")
if [[ "$books" -ge 20 ]]; then
	mood="Busy week"
elif [[ "$books" -ge 10 ]]; then
	mood="Steady week"
else
	mood="Quiet week"
fi
if [[ "$books" -ge 20 ]]; then
	mood="Busy week"
elif [[ "$books" -ge 10 ]]; then
	mood+"Steady week"
else
	mood="Quiet week"
fi
echo "=== Driftwood Books: Morning Report ==="
echo "Good morning, $opener. Today is $(date +%A)."
echo "Reading: $sales_file"
echo "Sales: $sales"
echo "Books: $books"
echo "Revenue: \$${revenue}"
echo "Online Revenue: \$${online}"
echo "Mood: $mood"
