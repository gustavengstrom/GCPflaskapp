#!/bin/bash
set -x
TOKEN=$(curl --silent --header  "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token)
ACCESS=$(echo ${TOKEN} | grep --extended-regexp --only-matching "(ya29.[0-9a-zA-Z._-]*)")
/usr/bin/docker login -u oauth2accesstoken -p "${ACCESS}" https://europe-west1-docker.pkg.dev
/usr/bin/docker pull europe-west1-docker.pkg.dev/reportall/cbuild/nginx:tag1
/usr/bin/docker run --rm -v  /var/run/docker.sock:/var/run/docker.sock -v "/home/composer/.docker:/root/.docker" -v "/home/composer:/home/composer" -w="/home/composer" docker/compose:1.24.0 up -d --build