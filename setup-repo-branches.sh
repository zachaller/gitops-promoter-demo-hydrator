#!/bin/bash

echo "Seting up environment/development"
git branch -D environment/development
git branch -D environment/development-next
git checkout --orphan environment/development
echo "Cleaning environment/development"
git rm -rf .
SHA=`git rev-parse main`
echo "Writing metadata file for development environment with dry sha: $SHA"
cat <<- EOF > hydrator.metadata
{"drySHA": "$SHA"}
EOF
git add hydrator.metadata
kustomize build development/ > manifest.yaml
git commit -m "inital environment setup"
git push --force --set-upstream origin environment/development
git checkout -b environment/development-next
git push --force --set-upstream origin environment/development-next



echo "Seting up environment/staging"
git branch -D environment/staging
git branch -D environment/staging-next
git checkout --orphan environment/staging
echo "Cleaning environment/staging"
git rm -rf .
SHA=`git rev-parse main`
echo "Writing metadata file for development environment with dry sha: $SHA"
cat <<- EOF > hydrator.metadata
{"drySHA": "$SHA"}
EOF
git add hydrator.metadata
git commit -m "inital environment setup"
git push --force --set-upstream origin environment/staging
git checkout -b environment/staging-next
git push --force --set-upstream origin environment/staging-next



echo "Seting up environment/production"
git branch -D environment/production
git branch -D environment/production-next
git checkout --orphan environment/production
echo "Cleaning environment/production"
git rm -rf .
SHA=`git rev-parse main`
echo "Writing metadata file for development environment with dry sha: $SHA"
cat <<- EOF > hydrator.metadata
{"drySHA": "$SHA"}
EOF
git add hydrator.metadata
git commit -m "inital environment setup"
git push --force --set-upstream origin environment/production
git checkout -b environment/production-next
git push --force --set-upstream origin environment/production-next


git checkout main
