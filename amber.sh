#!/bin/bash

function init() {
  git clone http://125.227.156.121:443/Amber/Build/coral-repo.git .manifest

  pushd .manifest
  git clone http://125.227.156.121:443/Amber/Build/coral-sku.git sku
  popd
}

function help() {
  echo "Amber Repo Script"
  echo " amber.sh init         : Initialize Amber Manifest"
  echo " amber.sh sync <xxx>   : Start to sync xxx SKU. (empty for generic)"
  echo " amber.sh update       : Based on the SKU set at first, then sync again"
  echo " amber.sh sku update   : Pull the latest SKU configurations"
  echo " amber.sh [-h, --help] : Show this help message"
}

if [[ $# -eq 0 ]] ; then
  help
  exit 1
fi

if [ "$1" == "init" ] ; then
  rm -rf .manifest
  init
  exit 0

else
  if [ -d ".manifest" ]; then
    python3 .manifest/main.py "$@"
  else
    echo "Please 'amber.sh init' first."
    exit 1
  fi
fi