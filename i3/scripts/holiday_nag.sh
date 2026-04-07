#!/bin/bash

MONTH=$(date +%m)
DAY=$(date +%d)

# Default values to ensure -m is NEVER empty
MESSAGE="System online. Welcome back."
TYPE="warning"

if [ "$MONTH" == "12" ]; then
    MESSAGE="Merry Christmas! Enjoy your holiday break and your Arch build."
    TYPE="warning"
elif [ "$MONTH" == "10" ] && [ "$DAY" == "31" ]; then
    MESSAGE="Happy Halloween! Watch out for ghost processes..."
    TYPE="error"
elif [ "$MONTH" == "04" ]; then
    # April - Chill mode
    MESSAGE="Happy Holidays! Time to chill, no work, just Linux. or simply continue working with Linux, i dont know lol"
    TYPE="warning"
fi

# We use direct arguments to avoid any "No message passed" glitch
swaynag -t "$TYPE" -m "$MESSAGE"
