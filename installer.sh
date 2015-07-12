#!/bin/bash

project_dir=$1; shift
project_dir=${project_dir:-"bosh-lites"}

missing_requirements=
if [[ "$(which vagrant)X" == "X" ]]; then
  echo "MISSING: install https://www.vagrantup.com/"
  missing_requirements=1
fi
if [[ "$(which direnv)X" == "X" ]]; then
  echo "MISSING: install http://direnv.net/"
  missing_requirements=1
fi
if [[ "${missing_requirements}" == "1" ]]; then
  exit 1
fi

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

bundle install

git add .
git commit -m "initial scaffold for boss-lite project"

echo
echo "NEXT: please edit .envrc with AWS credentials, keys, etc"
echo
echo "READ: the following document for using bosh-lite with AWS"
echo https://github.com/cloudfoundry/bosh-lite/blob/master/docs/aws-provider.md
echo
echo "NOTE: this is a PRIVATE repository that has your AWS credentials in it"
echo
