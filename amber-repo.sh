#!/bin/bash

git clone http://125.227.156.121:443/Amber/Build/coral-repo.git .repo

pushd .repo
git clone http://125.227.156.121:443/Amber/Build/coral-sku.git
popd
