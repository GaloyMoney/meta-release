#!/bin/bash

set -eu

if [[ -z $(git config --global user.email) ]]; then
  git config --global user.email "bot@galoy.io"
fi
if [[ -z $(git config --global user.name) ]]; then
  git config --global user.name "CI Bot"
fi

pushd repo

git checkout main
git status
git diff main release
git merge -X theirs --no-edit release
git status
git log -n 5
