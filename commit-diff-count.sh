#!/bin/bash
set -eoux pipefail

baseBranch=$1
secondaryBranch=$2

commitDiffCount=''

commitDiffCount=$(echo $(git log --oneline $secondaryBranch ^$baseBranch | wc -l))

echo '{"commitDiffCount": "'$commitDiffCount'"}' 
