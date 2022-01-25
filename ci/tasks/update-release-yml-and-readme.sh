#!/bin/bash

set -eu

. meta-release/ci/tasks/refs.sh

export tag=$(cat release/tag)
export commit_sha=$(cat release/commit_sha)

eval "export $ENTITY=$commit_sha"
eval "export `$ENTITY`_release_tag=$commit_sha"

envsubst < meta-release/template.md > meta-release/README.md

yq e -i ".$ENTITY = strenv(commit_sha)" meta-release/release.yml
yq e -i ".$ENTITY.release_tag = strenv(commit_sha)" meta-release/release.yml

if [[ -z $(git config --global user.email) ]]; then
  git config --global user.email "bot@galoy.io"
fi
if [[ -z $(git config --global user.name) ]]; then
  git config --global user.name "CI Bot"
fi

pushd meta-release
  git add README.md release.yml
  git status
  git commit -m "ci(release): publish new release for $ENTITY"
popd

echo "README:"
echo "------------------------------------------"
cat meta-release/README.md
echo "------------------------------------------"
echo ""
echo "RELEASE:"
echo "------------------------------------------"
cat meta-release/release.yml
echo "------------------------------------------"
