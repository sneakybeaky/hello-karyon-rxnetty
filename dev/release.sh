#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Supply path to local debian repo"
    exit 1
fi

reprepro -b $1 includedeb example build/distributions/*.deb &&  aws s3 sync $1 s3://s3-debian-repo.spinnaker.demo --region us-east-1