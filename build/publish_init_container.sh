#!/bin/sh

#####################################################
# This script publishes the container that contains #
#     opensearch plugins in to the artifactory      #
#####################################################

if [ $# -ne 4 ]; then
  echo "Usage: $0 <DOMAIN> <USERNAME> <PASSWORD> <VERSION>"
  exit 1
fi

DOMAIN=$1
USERNAME=$2
PASSWORD=$3
VERSION=$4

# Validate DOMAIN
if [ -z "$DOMAIN" ]; then
  echo "Domain is required."
  exit 1
fi

# Validate USERNAME
if [ -z "$USERNAME" ]; then
  echo "Username is required."
  exit 1
fi

# Validate PASSWORD
if [ -z "$PASSWORD" ]; then
  echo "Password is required."
  exit 1
fi

# Validate VERSION
if [ -z "$VERSION" ]; then
  echo "Version is required."
  exit 1
fi

cd ../services/plugin-installer

docker build -t dasunnimantha/opensearch-plugins-installer:$VERSION .
docker tag dasunnimantha/opensearch-plugins-installer:$VERSION dasunnimantha/opensearch-plugins-installer:latest
docker login -u $USERNAME -p $PASSWORD 
docker push dasunnimantha/opensearch-plugins-installer:$VERSION
echo "Docker Images pushed to artifactory. Exit code: ${'$'}?"
