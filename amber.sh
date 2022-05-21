#!/bin/bash

function init() {
  git clone http://125.227.156.121:443/Amber/Build/coral-repo.git .manifest

  pushd .manifest
  git clone http://125.227.156.121:443/Amber/Build/coral-sku.git
  popd
}

function help() {
  echo "Amber Repo Script"
  echo " amber.sh init      :  Initialize Amber Manifest"
  echo " amber.sh sync <xxx>:  Start to sync xxx SKU. (empty for generic)"
  echo " amber.sh sku yyy   :  Change SKU to yyy, then start to sync"
}

if [[ $# -eq 0 ]] ; then
  help
  exit 1
fi

if [ "$TARGET_CMD" == "init" ] ; then
  init
  exit 0

else
  if [ -d ".manifest" ]; then
    python3 .manifest/amber.py "$1"
  else
    echo "Please 'amber.sh init' first."
    exit 1
  fi
fi