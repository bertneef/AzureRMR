#!/bin/bash
set -o errexit -o nounset
addToDrat(){
  mkdir drat; cd drat

  ## Set up Repo parameters
  git init
  git config user.name "Hong-Revo"
  git config user.email "hongooi@microsoft.com"
  git config --global push.default simple

  ## Get drat repo
  git remote add upstream "https://$ghPat@github.com/cloudyr/cloudyr.github.io.git"
  git fetch upstream
  git checkout master

  Rscript -e "drat::insertPackage('../$PKG_TARBALL', repodir = './drat')"
  git add --all
  git commit -m "add $PKG_TARBALL (build $TRAVIS_BUILD_ID)"
  git push

}
addToDrat
