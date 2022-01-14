#!/bin/bash

set -eu

. repo/ci/tasks/refs.sh

export infra_new=$(cat infra-in/modules/infra/vendor/git-ref/ref)

if [[ $infra_new == $infra ]]; then
exit 0
fi

echo $infra_new > source-release-commitid/commitid

pushd infra-repo
git cliff --config ../repo/config.toml $infra..$infra_new > ../changelog/changelog
popd

cat changelog/changelog
