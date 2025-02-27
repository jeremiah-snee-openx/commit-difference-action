#!/bin/bash
set -eou pipefail

baseBranch=$1
secondaryBranch=$2

commitDiffCount=''

baseBranchPath=$(git for-each-ref --format='%(refname:short)' refs/remotes | grep "$baseBranch" | xargs)
secondaryBranchPath=$(git for-each-ref --format='%(refname:short)' refs/remotes | grep "$secondaryBranch" | xargs)

commitDiffCount=$(git log --oneline "$secondaryBranchPath" \^"$baseBranchPath" | wc -l | sed -e 's/^ *//')


echo '{"commitDiffCount": "'"$commitDiffCount"'"}' 
