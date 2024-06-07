#!/bin/bash
TOKEN=$(curl --silent --header  "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token)
ACCESS=$(echo ${TOKEN} | grep --extended-regexp --only-matching "(ya29.[0-9a-zA-Z._-]*)")
/usr/bin/docker login -u oauth2accesstoken -p "${ACCESS}" https://europe-west1-docker.pkg.dev
/usr/bin/docker pull europe-west1-docker.pkg.dev/reportall/cbuild/nginx:tag1