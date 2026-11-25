#!/bin/bash
# broken-tally.sh - add up the books in every weekly sales file
for file in sales-week*.csv; do
	total=0
	books=$(awk -F. 'NR > 1 { sum += $3 } END { print sum }' "$file")
	total=$((total + bookz))
	echo "$file: $books books"
done
echo "Total books: $total"
