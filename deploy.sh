#!/usr/bin/env bash

set -ev

ORG=steinf
REPO=${CIRCLE_PROJECT_REPONAME,}
COMMIT_HASH=$CIRCLE_SHA1

# build docker container
docker login -e "$DOCKER_EMAIL" -u "$DOCKER_USER" -p "$DOCKER_PASS"
docker info
docker build -t $ORG/$REPO:latest .
docker build -t $ORG/$REPO:$COMMIT_HASH .
docker push $ORG/$REPO:latest
docker push $ORG/$REPO:$COMMIT_HASH
