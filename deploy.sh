#!/bin/bash

set -e 
printf "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t hello-friend-ng # 注意請更換

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
