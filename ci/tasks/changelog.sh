#!/bin/bash

set -eu

export new_ref=$(cat $new_git_ref_path)

pushd repo
export prev_ref=$(git rev-list -n 1 $depl_name-v$(cat ../version/version))
popd

echo $new_ref > release-commitid/commitid

if [[ $new_ref == $prev_ref ]]; then
  echo "Refs didn't change, changelog will be empty..."
  echo "" > changelog/changelog
else
  pushd repo
    git cliff --config ../meta-release/config.toml $prev_ref..$new_ref > ../changelog/changelog
  popd
fi

echo "CHANGELOG :-"
echo "------------------------------------------------------"
cat changelog/changelog
echo "------------------------------------------------------"
