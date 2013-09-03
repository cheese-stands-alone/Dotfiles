#!/bin/bash

gitacc=git@github.com:rwhite226/Dotfiles.git

# Git add any changed files
git add -A

#Ask for and add a commit for git
echo "Add commit"
read commit
git commit -m "$commit"

# Push changes to gitacc
git push $gitacc

