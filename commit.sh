#!/bin/bash

if $INPUT_DEBUG 
then
  set -x
fi

echo "Adding git commit"
git add .
if git status | grep -q "Changes to be committed"
then
  git commit --message "$INPUT_COMMIT_MSG"
  echo "Pushing git commit"
  git push -u origin "HEAD:$OUTPUT_BRANCH"
else
  echo "No changes detected"
fi