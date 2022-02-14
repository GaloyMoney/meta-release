#!/bin/bash

set -eu

export new_ref=$(cat $new_git_ref_path)
echo $new_ref > release-commitid/commitid

# Initial Release
if [[ $(cat version/version) == "0.0.0" ]]; then
  pushd repo
    git cliff --config ../pipeline-tasks/config.toml > ../changelog/changelog
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
    export no_change=1
    echo "Refs didn't change, changelog will be empty..."
    echo "" > changelog/changelog
  else
    pushd repo
      git cliff --config ../pipeline-tasks/config.toml $prev_ref..$new_ref > ../changelog/changelog
    popd
  fi
fi

if [[ $gen_src == "true" ]] && [[ $no_change != "1" ]]; then
  pushd repo

  git checkout $prev_ref
  export prev_src_ref=$(yq e '.appVersion' charts/$depl_name/Chart.yaml)

  git checkout $new_ref
  export new_src_ref=$(yq e '.appVersion' charts/$depl_name/Chart.yaml)

  popd

  if [[ $prev_src_ref != $new_src_ref ]]; then
    pushd src-repo
      git cliff --config ../pipeline-tasks/config.toml $prev_src_ref..$new_src_ref > ../src-changes
    popd

cat <<EOF >changes
## Source Changes
$(cat src-changes)

## Chart Changes
$(cat changelog/changelog)
EOF

    cat changes > changelog/changelog

  fi
fi

echo "CHANGELOG :-"
echo "------------------------------------------------------"
cat changelog/changelog
echo "------------------------------------------------------"
