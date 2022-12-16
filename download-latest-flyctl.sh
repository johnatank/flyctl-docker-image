#!/bin/sh

cd /tmp

#Getting latest JSON about flyctl release for Linux x86_64
curl https://api.github.com/repos/superfly/flyctl/releases/latest > flyctl.json
cat flyctl.json | jq '.assets | map(select(.browser_download_url | contains ("Linux_x86_64"))) ' | jq '.[]' > build.json

#Assigning version
FLYCTL_TAG=$(cat flyctl.json | jq -r .name")

#Assagning URL
FLYCTL_TARBALL_URL=$(cat build.json | jq -r .browser_download_url")

#Assagning tarball name
FLYCTL_TARBALL_NAME=$(cat build.json | jq -r .name")

#Download tarball
wget $FLYCTL_TARBALL_URL

#Extracl file is exists
if [ -e $FLYCTL_TARBALL_NAME ]; then
  tar -zxvf $FLYCTL_TARBALL_NAME -C /usr/sbin
else
  echo "$FLYCTL_TARBALL_NAME doesn't exist"
  exit 1
fi

exit 0