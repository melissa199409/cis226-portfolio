#!/bin/bash
# report-all.sh - run the opening report on every sales file in a folder
set -euo pipefail
usage() {
	echo "Usage: ./report-all.sh [folder]"
	echo "Run the opening report on every .csv file in the folder."
}
log() {
	echo "report-all: $*"
}
run_one() {
	local file="$1"
	local status=0
	local output
	output=$(echo "Sam" | ./opening-report.sh "$file" 2>&1) || status=$?
	if [[ $status -eq 0 ]]; then
		log "OK  $(basename "$file") - $(echo "$output" | grep '^Mood:')"
else
	log "FAIL $(basename "$file") - exit code $status"
fi
return "$status"
}
case "${1:-}" in
	-h|--help)
	usage
	exit 0
	;;
esac
folder="${1:-.}"
if [[ ! -d "$folder" ]]; then
	echo "Error: '$folder' is not a folder." >&2
	exit 1
fi
files=("$folder"/*.csv)
if [[ ! -e "${files[0]}" ]]; then
	echo "Error: no .csv files in '$folder'." >&2
	exit 2
fi
good=0
bad=0
for file in "${files[@]}"; do
	if run_one "$file"; then
		good=$((good + 1))
	else
		bad=$((bad + 1))
	fi
done
log "Done: $good good, $bad bad, out of ${#files[@]} files."
if [[ $bad -gt 0 ]]; then
	exit 3
fi
