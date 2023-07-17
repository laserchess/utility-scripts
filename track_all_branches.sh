#!/bin/bash

# Synchronize local data with remote repository
echo "Fetching the remote repository..."
git fetch --all
echo "Fetched successfully"

raw_remotes=$(git branch -r | grep -ve "^$" | sed -r "s/\s+//g")
readarray -t remotes <<<"$raw_remotes"
raw_existing_branches=$(git branch --list | sed -r 's/\*//g; s/\s+//g')
# readarray -t existing_branches <<<"$raw_existing_branches"
# echo "${#existing_branches[@]}"
# echo "$existing_branches"
for remote in "${remotes[@]}"
do
  branch_name=${remote#origin/}
  echo "$branch_name"
  if [[ ! ("$branch_name" =~ " $raw_exisiting_branches" || "$branch_name" =~ "$raw_exisiting_branches ") ]]
  then
    echo "if $branch_name"
  fi
  # git branch --set-upstream-to="${remote#origin/}" "$remote"
done
# git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
# git fetch --all
# git pull --all
