#!/usr/bin/env bash 

project_dir=${1:-"bosh-lites"}

missing_requirements=false
if [[ -z "$(which vagrant)" ]]; then
  echo "MISSING: Vagrant. Please install Vagrant: https://www.vagrantup.com/"
  missing_requirements=true
fi

if [[ -z "$(vagrant plugin list | grep aws)" ]]; then
  echo "Installing AWS provider plugin..."
  vagrant plugin install vagrant-aws
fi

if [[ -z "$(vagrant box list | grep cloudfoundry/bosh-lite | grep aws)" ]]; then
  echo "Installing cloufoundry/bosh-lite required for AWS provider"
  vagrant box add --provider aws cloudfoundry/bosh-lite
fi

if [[ -z "$(which direnv)" ]]; then
  echo "MISSING: direnv, please install direnv: http://direnv.net/"
  missing_requirements=true
fi

if [[ "${missing_requirements}" == "true" ]]; then
  exit 1
fi

if [[ "$(vagrant -v)" != "Vagrant 1.6.3" && "$(vagrant -v)" != "Vagrant 1.6.5" ]]; then
  echo "WEIRD BUT TRUE: You must use Vagrant 1.6.3 or 1.6.5"
  echo "Learn more: https://github.com/cloudfoundry/bosh-lite/issues/235"
  echo "Download: https://www.vagrantup.com/download-archive/v1.6.5.html"
  exit 1
fi

snowwhite_repo=${snowwhite_repo:-"https://github.com/cloudfoundry-community/snowwhite.git"}
snowwhite_branch=${snowwhite_branch:-"master"}
bosh_lite_repo=${bosh_lite_repo:-"https://github.com/cloudfoundry/bosh-lite.git"}
bosh_lite_branch=${bosh_lite_branch:-"master"}

set -e

mkdir $project_dir
cd $project_dir
mkdir sshkeys; chmod 700 sshkeys; touch sshkeys/.gitkeep
git init; git add .; git commit -m "initial repo"
git subtree add --prefix snowwhite $snowwhite_repo $snowwhite_branch --squash
git subtree add --prefix bosh-lite $bosh_lite_repo $bosh_lite_branch --squash

if [[ "${LOCAL_SCAFFOLD}X" == "X" ]]; then
  cp -r snowwhite/scaffold/* .
  cp -r snowwhite/scaffold/.envrc .
else
  cp -r ${LOCAL_SCAFFOLD}/ .
fi

bundle install

git add .
git commit -m "Initial scaffold for snowwhite project."

echo <<EOS
Congrats! Your snowwhite project is ready!

NEXT STEPS

  Please edit the .envrc file with AWS credentials, keys, etc... and change
  the values to your account.

  READ the following document for using bosh-lite with AWS:

    https://github.com/cloudfoundry/bosh-lite/blob/master/docs/aws-provider.md

  READ the snowwhite README for usage instructions:

    https://github.com/cloudfoundry/snowwhite/blob/master/README.md

PLEASE NOTE

  This is a PRIVATE repository that has your AWS credentials in it! 
  For this reason, please please please do not make it a public repository!

EOS
