#!/bin/bash

[[ $INPUT_DEBUG == 'true' ]] && set -x

echo "Cleaning source folder"

echo "Removing the following files... "

if [[ -f .helmignore ]]; then



  while read -r str1; do
    # if the first line of .helmignore
    # starts with "#" it will bypass it.
    [[ ${str1:0:1} == "#" ]] && continue

    echo "From .helmignore: $str1 ..." 
    rm -rfv "$str1"
  done < .helmignore

fi

if [[ -z $INPUT_CLEAN_FILES ]]; then

  IFS="," read -r -a arr1 <<< "$INPUT_CLEAN_FILES"

  ## @discription loops through arry and removed selected files
  for files in "${arr1[@]}"; do

    echo "From .helmignore: $files ..."

    # @discription -r=directories and content, -f=force, -v=verbose
    rm -rfv "${INPUT_SOURCE_FOLDER:?}"/"$files"
  done

fi