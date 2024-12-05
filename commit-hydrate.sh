#!/bin/bash

git commit -a -m "commiting dry changes"

kustomize build development/ > manifest.yaml
git checkout environment/development-next
SHA=`git rev-parse main`
echo "Writing metadata file for development environment with dry sha: $SHA"
cat <<- EOF > hydrator.metadata
{"drySHA": "$SHA"}
EOF
git add hydrator.metadata
git add manifest.yaml
git commit -a "hydrataing commit $SHA"
git push -y origin environment/development-next
