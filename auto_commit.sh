#!/bin/bash

cd /home/beqishh/push-flow || exit

commits_file="/home/beqishh/push-flow/commits_today.txt"
last_clean_file="/home/beqishh/push-flow/last_clean_date.txt"
log_file="/home/beqishh/push-flow/auto_update.txt"

current_date=$(date +%Y-%m-%d)
if [ ! -f "$last_clean_file" ] || [ "$current_date" != "$(cat "$last_clean_file")" ]; then
    > "$log_file"
    echo "$current_date" > "$last_clean_file"

    commits_today=$((65 + RANDOM % 16))
    echo $commits_today > "$commits_file"
fi

commits_left=$(cat "$commits_file")

if [ "$commits_left" -gt 0 ]; then
    echo "$(date) - Daily auto commit" >> "$log_file"

    git add .
    git commit -m "Auto commit - Remaining: $commits_left on $(date)"
    git push origin main

    echo $((commits_left - 1)) > "$commits_file"
fi
