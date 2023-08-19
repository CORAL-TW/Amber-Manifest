#!/bin/bash

PYTHON=""

if ! command -v python3 &> /dev/null
then

  if ! command -v python &> /dev/null
  then
    echo "Please check python install correctly"
    exit 1
  else
    PYTHON="python"
  fi
else
  PYTHON="python3"
fi

function init() {
  git clone https://github.com/CORAL-Sense/coral-repo.git .manifest

  pushd .manifest
  git clone https://github.com/CORAL-Sense/coral-sku.git sku
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
    ${PYTHON} .manifest/main.py "$@"
  else
    echo "Please 'amber.sh init' first."
    exit 1
  fi
fi
