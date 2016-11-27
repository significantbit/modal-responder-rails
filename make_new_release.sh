#!/usr/bin/env bash

DOCKER_IMAGE_NAME="$USER/modal-responder-rails"
LIBRARY_NEW_VERSION=`cat lib/**/*.rb | grep VERSION | sed -n "s/VERSION = '\(.*\)'.*/\1/p" | awk '{print $1}'`

LIBRARY_UPDATED=`git status --porcelain | grep -v "CHANGELOG.md" | grep -v "lib/modal-responder-rails/version.rb"`
if [[ -n "$LIBRARY_UPDATED" ]]; then
  echo "Your repository is not clean !"
  exit 1
fi

echo "Ensuring Docker image $DOCKER_IMAGE_NAME exists ..."
EXISTING_DOCKER_IMAGE=`docker images | grep "$DOCKER_IMAGE_NAME"`
if [[ -z "$EXISTING_DOCKER_IMAGE" ]]; then
  echo "Building the Docker image ..."
  docker build -t "$DOCKER_IMAGE_NAME" .
fi

echo "Committing new version ..."
git commit -am "Import version $LIBRARY_NEW_VERSION"

echo "Releasing gem ..."
docker run --rm -v ~/.gitconfig:/root/.gitconfig \
  -v ~/.ssh/:/root/.ssh/ \
  -v ~/.gem/:/root/.gem/ \
  -v `pwd`:/gem/ "$DOCKER_IMAGE_NAME" rake release
