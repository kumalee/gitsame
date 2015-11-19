#!/bin/bash

ORIG_COMMIT=$1
TARGET_BRANCH=$2

if [ -z "$ORIG_COMMIT" ]
then
  echo "Enter the commit hash you want to find:"
  read ORIG_COMMIT
  if [ -z "$ORIG_COMMIT" ]
  then
    echo "Commit hash is required"
    echo "Usage: gitsame <commit hash> [target branch]"
    echo "Default branch is --all"
    exit 1
  fi
fi

if [ -z "$TARGET_BRANCH" ]
then
  TARGET_BRANCH="--all"
fi

origCommitInfo=$(git log -1 --pretty="%an %ae %ad" $ORIG_COMMIT)

for rev in $(git rev-list "$TARGET_BRANCH")
do
   testPatchInfo=$(git log -1 --pretty="%an %ae %ad" $rev)
   if [ "$origCommitInfo" = "$testPatchInfo" ]
   then
      branch=$(git branch --contains $rev | trim)
      if [ "$branch" = "" ]
      then
	 branch='None'
	 echo  "\033[31m${branch}"
	 echo  "\033[0m${rev} \n"
      else
	 echo  "\033[32m${branch}"
	 echo  "\033[0m${rev} \n"
      fi
   fi
done
