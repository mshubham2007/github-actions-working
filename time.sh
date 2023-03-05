#!/bin/bash

# Get the current date from the runner in YYYY-MM-DD format
current_date=$(date -u +%F)

# Get the latest commit date from the master branch in Git in UTC format
latest_commit_date=$(git log -1 --pretty=format:%cd --date=format:'%Y-%m-%d' origin/master)

# Set the target timezone
target_timezone="America/New_York"

# Convert both dates to Unix timestamps
target_timestamp=$(TZ=$target_timezone date -d "$latest_commit_date" +%s)
current_timestamp=$(date -d "$current_date" +%s)

# Calculate the number of seconds between the two timestamps
seconds=$((target_timestamp - current_timestamp))

# Calculate the number of days between the two timestamps
days=$((seconds / 86400))

# Print the result
echo "Number of days between $current_date UTC and $latest_commit_date $target_timezone: $days"
