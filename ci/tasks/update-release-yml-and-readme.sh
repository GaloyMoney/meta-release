#!/bin/bash

set -eu

. meta-release/ci/tasks/refs.sh

export tag=$(cat release/tag)
export commit_sha=$(cat release/commit_sha)

eval "export $ENTITY=$commit_sha"
eval "export `echo $ENTITY`_release_tag=$tag"

envsubst < meta-release/template.md > meta-release/README.md

yq e -i ".$ENTITY.commit = strenv(commit_sha)" meta-release/release.yml
yq e -i ".$ENTITY.release_tag = strenv(tag)" meta-release/release.yml

pushd meta-release
  git add README.md release.yml
  git status

  # Only commit if there are uncommitted staged files
  if ! git diff --cached --exit-code; then
    git commit -m "ci(release): publish new release for $ENTITY"
  fi
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
