#!/bin/env bash

# oc new-app --name vertx-site \
#   --build-env MAVEN_MIRROR_URL=http://nexus-common.apps.na410.prod.nextcle.com/repository/java \
#   -i redhat-openjdk18-openshift:1.8 \
#   --context-dir builds-applications/apps/vertx-site \
#   https://github.com/mikelo/DO288-apps#pipeline

cd  "$(workspaces.manifest-dir.path)/$(params.MVN_APP_PATH)" || exit 1
oc new-build --name=$(params.DEPLOY_APP_NAME) \
  -l app=$(params.DEPLOY_APP_NAME) --binary=true \
  --image-stream=openshift/java:8 || echo "BC already exists"
oc start-build $(params.DEPLOY_APP_NAME) --wait=true \
    --from-file=$(params.DEPLOY_ARTIFACT_NAME)
oc new-app $(params.DEPLOY_APP_NAME):latest \
    --name $(params.DEPLOY_APP_NAME) || echo "application exists"
oc expose svc $(params.DEPLOY_APP_NAME) || echo "route exists"
