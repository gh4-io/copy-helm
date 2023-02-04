#!/bin/bash

if $INPUT_DEBUG 
then
  set -x
fi

if [ -z "$INPUT_SOURCE_FOLDER" ]
then
  echo "Source folder must be defined"
  return 1
fi

if [ -z "$INPUT_DESTINATION_BRANCH" ]
then
  export INPUT_DESTINATION_BRANCH=master
fi
export OUTPUT_BRANCH="$INPUT_DESTINATION_BRANCH"

if [ -z "$INPUT_COMMIT_MSG" ]
then
  export INPUT_COMMIT_MSG="Update $INPUT_DESTINATION_FOLDER."
fi