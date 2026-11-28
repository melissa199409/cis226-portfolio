#!/bin/bash
## check-plan.sh - check that a Capstone plan has every section
set -euo pipefail
usage() {
	echo "Usage: ./check-plan.sh [plan-file]"
	echo "Checks for six sections, each with at least 10 words."
}
log() {
	echo "check-plan: $*"
}
check_section() {
   local plan="$1"
   local name="$2"
   local words
words=$(awk -v h="## $name" '
       index($0, h) == 1 {found = 1; next}
       /^## / {found = 0}
       found
' "$plan" | wc -w)
if [[ $words -ge 10 ]]; then
	log "OK $name - $words words"
else
	log "MISSING $name - $words words, need at least 10"
	return 1
fi
}
case "${1:-}" in
	-h|--help)
		usage
		exit 0
		;;
esac
plan="${1:-PLAN.md}"
if [[ ! -f "$plan" ]]; then
	echo "Error: '$plan' is not a file." >&2
	exit 1
fi
if [[ ! -s "$plan" ]]; then
	echo "Error: '$plan' is empty." >&2
	exit 2
fi
sections=(
	"Problem"
	"What it does"
	"How it works"
	"What can go wrong"
	"How I will test it"
	"Week 15 schedule"
)
good=0
bad=0
for section in "${sections[@]}"; do
	if check_section "$plan" "$section"; then
		good=$((good + 1))
	else
		bad=$((bad + 1))
	fi
done
total=$(wc -w < "$plan")
if [[ $total -gt 500 ]]; then
	log "TOO LONG - $total words, one page is about 500 at most"
	bad=$((bad + 1))
fi
log "Done: $good of ${#sections[@]} sections OK, $total words."
if [[ $bad -gt 0 ]]; then
	exit 3
fi
exit 0
