#!/bin/bash

git commit -a -m "commiting dry changes"
git push -u origin main

kustomize build development/ > manifest.yaml-next
git checkout environment/development-next
rm manifest.yaml
mv manifest.yaml-next manifest.yaml
SHA=`git rev-parse main`
echo "Writing metadata file for development environment with dry sha: $SHA"
cat <<- EOF > hydrator.metadata
{"drySHA": "$SHA"}
EOF
git add hydrator.metadata
git add manifest.yaml
git commit -a -m "hydration of dry commit $SHA"
git push -u origin environment/development-next
git checkout main



kustomize build staging/e2e > manifest.yaml-e2e-next
kustomize build staging/integration > manifest.yaml-integration-next
git checkout environment/staging-next
rm e2e/manifest.yaml
mv manifest.yaml-e2e-next e2e/manifest.yaml
mv manifest.yaml-integration-next integration/manifest.yaml
SHA=`git rev-parse main`
echo "Writing metadata file for staging environment with dry sha: $SHA"
cat <<- EOF > hydrator.metadata
{"drySHA": "$SHA"}
EOF
git add hydrator.metadata
git add e2e/
git add integration/
git commit -a -m "hydration of dry commit $SHA"
git push -u origin environment/staging-next
git checkout main



kustomize build production/us-east-2 > manifest.yaml-us-east-2-next
kustomize build production/us-west-1 > manifest.yaml-us-west-1-next
git checkout environment/production-next
rm e2e/manifest.yaml
mv manifest.yaml-us-east-2-next us-east-2/manifest.yaml
mv manifest.yaml-us-west-1-next us-west-1/manifest.yaml
SHA=`git rev-parse main`
echo "Writing metadata file for production environment with dry sha: $SHA"
cat <<- EOF > hydrator.metadata
{"drySHA": "$SHA"}
EOF
git add hydrator.metadata
git add us-east-2/
git add us-west-1/
git commit -a -m "hydration of dry commit $SHA"
git push -u origin environment/production-next
git checkout main
