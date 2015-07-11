#!/bin/bash

project_dir=$1; shift
project_dir=${project_dir:-"bosh-lites"}

boss_lite_repo=${boss_lite_repo:-"https://github.com/cloudfoundry-community/boss-lite.git"}
boss_lite_branch=${boss_lite_branch:-"master"}
bosh_lite_repo=${bosh_lite_repo:-"https://github.com/cloudfoundry/bosh-lite.git"}
bosh_lite_branch=${bosh_lite_branch:-"master"}

set -e

mkdir $project_dir
cd $project_dir
touch .gitigore
git init
git add .
git commit -m "initial repo"
git subtree add --prefix boss-lite $boss_lite_repo $boss_lite_branch --squash
git subtree add --prefix bosh-lite $bosh_lite_repo $bosh_lite_branch --squash

if [[ "${LOCAL_SCAFFOLD}X" == "X" ]]; then
  cp -r boss-lite/scaffold/ .
else
  cp -r ${LOCAL_SCAFFOLD}/ .
fi

git add .
git commit -m "initial scaffold for boss-lite project"
