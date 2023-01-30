#!bin/bash

set -e

if $INPUT_DEBUG 
then
  set -x
fi

echo "Cleaning source folder"

echo "Removing the following files... "
echo "$INPUT_CLEAN_FILES"


IFS="," read -r -a arr1 <<< $INPUT_CLEAN_FILES

## @discription loops through arry and removed selected files
for files in "${arr1[@]}"; do
  # @discription -r=directories and content, -f=force, -v=verbose
  rm -rfv "$INPUT_SOURCE_FOLDER"/$files
done