#!/bin/bash

set -eu

. repo/ci/tasks/refs.sh

export infra_new=$(cat infra-in/modules/infra/vendor/git-ref/ref)

echo $infra
echo $infra_new

pushd infra-repo
git cliff $infra...$infra_new > ../changelog/changelog
popd

cat changelog/changelog
