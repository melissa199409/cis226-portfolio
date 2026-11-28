# Capstone Plan: Disk Space Watchdog

## Problem
 Linux users can run out of disk space without noticing. When the disk is almost full, programs may stop working correctly. Checking disk space by hand takes time. My tool will check disk usage and warn users when space is too high.

## What it does
 The script disk-watchdog.sh will check the disk space used on the computer. It will show the percentage used and warn users when usage reaches 80%. Users can change the limit with -- limit N. The -- help option will show instructions.
Sample: Disk Watchdog: 75% used. Disk Watchdog Warning! 85% used.

## How it works
 The script will use Bash, df, awk, and date. It will hacve functions: usage() for instruction, log() for saving message, get_usage)_ for reading disk usage, check_limit() for checking the percentage, and main() for runnign the program. 

## What can go wrong
Three problems can happen.First, the system command may file. The script will print an error and exit 1. Second, the user may eneter an invalid limit. It will print a helpful message and exit 2. Third, disk usage may be above 80%. It will printa warning and exit 3.

## How I will test it
Run 1: Test a disk with 50% usage.Expected result: OK and exit 0.
Run 2: Test a disk with 90% usage.Expected result:Warning and exit 3.
Run 3: Enter an invalid limit such as abc.Expected result: Error and exit 2.
Run 4: Test a missing.Expected result: Error and exit 1.

## Week 15 schedule
Monday (2 hours): Create the script and functions.
Tuesday (2 hours): Add disk checks and error handling.
Wednesday (1.5 hours): Test inputs and fix problems.
Thursday (1 hour): Write the README with instructions and sample output.
Friday (1.5 hours): Add comments, make two Git commits, record a 60 to 90 second screencast, and submit.
Cut line: If I run late, I will remove extra options but keep the main disk check.
