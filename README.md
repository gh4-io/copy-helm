[action-badge]: https://img.shields.io/badge/-Action-24292e?logo=github&style=for-the-badge

[![Github Action][action-badge]](#)
&nbsp;

# copy-helm

This GitHub Action is useful tool to copy helm charts from parent repository to common charts repository. 

## Table of Contents

- [copy-helm](#copy-helm)
  - [Table of Contents](#table-of-contents)
  - [Usage](#usage)
  - [Example Workflow](#example-workflow)
  - [Variables](#variables)
  - [Behavior Notes](#behavior-notes)

## Usage

1. Implement by createing your own workflow

some text...

---

## Example Workflow
    name: Push File

    on: push

    jobs:
      copy-file:
        runs-on: ubuntu-latest
        steps:
        - name: Checkout
          uses: actions/checkout@v2

        - name: Pushes test folder
          uses: datalbry/copy_folder_to_another_repo_action@1.0.0
          env:
            API_TOKEN_GITHUB: ${{ secrets.API_TOKEN_GITHUB }}
          with:
            source_folder: 'test_files'
            destination_repo: 'dmnemec/release-test'
            destination_folder: 'test-dir'
            user_email: 'devin.nemec@gmail.com'
            user_name: 'dmnemec'
            commit_msg: '[GHA] Update the test files.'

---

## Variables
* **source_folder:** The folder to be moved.
* **destination_repo:** The repository to place the folder in.
* **destination_folder:** [optional] The folder in the destination repository to place the file in, if not the root directory.
* **user_email:** The GitHub user email associated with the API token secret.
* **user_name:** The GitHub username associated with the API token secret.
* **destination_branch:** [optional] The branch of the destination repo to base the changes on and push to (defaults to master).
* **destination_branch_create:** [optional] The branch the changes should be pushed to; defaults to commiting to `destination_branch`; is useful for creating PRs
* **commit_msg:** [optional] The commit message to use.
* **clean_files:** [optional] String of files or extensions to removed before transfer.
* **debug:** [optional] Debug, true or false

---

## Behavior Notes

The action will remove the destionation folder before recreating it to place any copied files in it.