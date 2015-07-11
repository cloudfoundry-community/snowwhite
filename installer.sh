#!/bin/bash

project_dir=$1; shift
project_dir=${project_dir:-"bosh-lites"}

boss_lite_repo=${boss_lite_repo:-"https://github.com/cloudfoundry-community/boss-lite.git"}
boss_lite_branch=${boss_lite_branch:-"master"}

set -e

mkdir $project_dir
cd $project_dir
cat > README.md <<EOS
# bosh-lites

EOS
git init
git add .
git commit -m "initial scaffold"
git subtree add --prefix boss-lite $boss_lite_repo $boss_lite_branch --squash
