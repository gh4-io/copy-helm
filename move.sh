#!/bin/bash

[[ $INPUT_DEBUG == 'true' ]] && set -x

CLONE_DIR=$(mktemp -d)

echo "Cloning destination git repository"
git config --global user.email "$INPUT_USER_EMAIL"
git config --global user.name "$INPUT_USER_NAME"
git clone --single-branch --branch "$INPUT_DESTINATION_BRANCH" "https://$INPUT_USER_NAME:$API_TOKEN_GITHUB@github.com/$INPUT_DESTINATION_REPO.git" "$CLONE_DIR"

if [ -n "$INPUT_DESTINATION_BRANCH_CREATE" ]
then
  git checkout -b "$INPUT_DESTINATION_BRANCH_CREATE"
  export OUTPUT_BRANCH="$INPUT_DESTINATION_BRANCH_CREATE"
fi

echo "Copying contents to git repo"
# shellcheck disable=SC2115
if [ -z "$INPUT_DESTINATION_FOLDER" ]
then
  rm -rf "${CLONE_DIR:?}/"*
  cp -r "${INPUT_SOURCE_FOLDER:?}/"* "${CLONE_DIR:?}/"
else
  rm -rf "${CLONE_DIR:?}/${INPUT_DESTINATION_FOLDER:?}/"
  mkdir -p "${CLONE_DIR:?}/${INPUT_DESTINATION_FOLDER:?}/"
  cp -a "${INPUT_SOURCE_FOLDER:?}/." "${CLONE_DIR:?}/${INPUT_DESTINATION_FOLDER:?}/"
fi

cd "$CLONE_DIR" || exit