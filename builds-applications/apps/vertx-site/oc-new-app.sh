#!/bin/env bash

oc new-app --name vertx-site \
  --build-env MAVEN_MIRROR_URL=http://nexus-common.apps.na410.prod.nextcle.com/repository/java \
  -i redhat-openjdk18-openshift:1.8 \
  --context-dir builds-applications/apps/vertx-site \
  https://github.com/mikelo/DO288-apps#pipeline
