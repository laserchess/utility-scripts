#!/bin/bash

# Synchronize local data with remote repository
echo "Fetching the remote repository..."
git fetch --all
echo "Fetched successfully"

# Get all remote branches
raw_remotes=$(git branch -r | sed -r "s/\s+//g" | grep -Ei "^[a-z0-9\/]+$")
readarray -t remotes <<<"$raw_remotes"
# Set remote upstreams to matching local branches
for remote in "${remotes[@]}"
do
  branch_name=${remote#origin/}
  git branch "$branch_name" 2> /dev/null
  git branch --set-upstream-to="${remote}" "$branch_name"
done
