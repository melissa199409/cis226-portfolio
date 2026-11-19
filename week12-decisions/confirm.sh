#!/bin/bash

# confirm.sh - ask before doing something you cannot undo

read -r -p "Delete scratch.txt? (y/n) " answer

case "$answer" in

  [Yy]|[Yy][Ee][Ss])
    rm -f scratch.txt
    echo "scratch.txt deleted."
    ;;

  [Nn]|[Nn][Oo])
    echo "OK, nothing deleted."
    ;;

  *)
    echo "Please answer y or n." >&2
    exit 1
    ;;

esac
