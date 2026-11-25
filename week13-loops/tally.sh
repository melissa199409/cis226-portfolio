#!/bin/bash
# tally.sh - add up the books in every weekly sales file
total=0
for file in sales-week*.csv; do
	books=$(awk -F, 'NR > 1 { sum += $3 } END { print sum }' "$file")
	total=$((total + books))
	echo "$file: $books books"
done
echo "Total books: $total"
