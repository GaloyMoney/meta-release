#!/bin/bash

set -eu

. meta-release/ci/tasks/refs.sh

export new_ref=$(cat $new_git_ref_path)

echo $new_ref > release-commitid/commitid

if [[ $new_ref == ${!depl_name} ]]; then
  echo "Refs didn't change, changelog will be empty..."
  echo "" > changelog/changelog
else
  pushd repo
    git cliff --config ../meta-release/config.toml ${!depl_name}..$new_ref > ../changelog/changelog
  popd
fi

echo "CHANGELOG :-"
echo "------------------------------------------------------"
cat changelog/changelog
echo "------------------------------------------------------"
