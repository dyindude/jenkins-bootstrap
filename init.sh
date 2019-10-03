#!/usr/bin/env bash
source hostinfo
export ENVIRONMENT=prod
export ENVIRONMENT_SUFFIX=
export SERVICE=jenkins

cd docker/nginx
docker-compose down && docker-compose up -d
cd ../jenkins
docker-compose -p ${SERVICE}${ENVIRONMENT} build
docker-compose -p ${SERVICE}${ENVIRONMENT} down
docker-compose -p ${SERVICE}${ENVIRONMENT} up -d
