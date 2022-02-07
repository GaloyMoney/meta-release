#!/bin/bash

set -eu

export new_ref=$(cat $new_git_ref_path)
echo $new_ref > release-commitid/commitid

# Initial Release
if [[ $(cat version/version) == "0.0.0" ]]; then
  pushd repo
    git cliff --config ../meta-release/config.toml > ../changelog/changelog
  popd

# Subsequent Releases
else
  # Strips off "-dev"
  bump2version pre --current-version $(cat version/version) --allow-dirty version/version

  pushd repo
  if [[ $depl_name != 'infra' ]]; then
    export prev_ref=$(git rev-list -n 1 $depl_name-v$(cat ../version/version))
  else
    export prev_ref=$(git rev-list -n 1 $(cat ../version/version))
  fi
  popd

  if [[ $new_ref == $prev_ref ]]; then
    echo "Refs didn't change, changelog will be empty..."
    echo "" > changelog/changelog
  else
    pushd repo
      git cliff --config ../meta-release/config.toml $prev_ref..$new_ref > ../changelog/changelog
    popd
  fi
fi

echo "CHANGELOG :-"
echo "------------------------------------------------------"
cat changelog/changelog
echo "------------------------------------------------------"
