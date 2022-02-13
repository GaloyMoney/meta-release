#!/bin/bash

set -eu

pushd charts-repo

git checkout $(cat ../charts-release/commit_sha)
export appVersion=$(yq e '.appVersion' charts/$CHART/Chart.yaml)

popd

export DOCKER_IMAGE="$DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$appVersion"

pushd image

docker pull $DOCKER_IMAGE
docker save $DOCKER_IMAGE -o image.tar

# Tries to mimic https://github.com/concourse/registry-image-resource#files-created-by-the-resource
echo "$DOCKER_REGISTRY/$DOCKER_IMAGE_NAME" > repository
echo $appVersion > tag
echo "$(docker inspect --format='{{index .RepoDigests 0}}' DOCKER_IMAGE | cut -d'@' -f 2)" > digest
