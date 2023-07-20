#!/bin/bash

set -eu

pushd repo

git checkout $(cat ../release-commitid/commitid)
git checkout -b release
