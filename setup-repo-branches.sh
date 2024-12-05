#!/bin/bash

git checkout --orphan environment/development

echo "Cleaning environment/development"
git rm -rf .
SHADEV=`git rev-parse main`
echo "Writing metadata file for development environment with dry sha: $SHADEV"
cat <<- EOF > hydrator.metadata
{"drySHA": "$SHADEV"}
EOF
git add hydrator.metadata
git commit -m "inital environment setup"
git push --set-upstream origin environment/development

#git checkout --orphan environment/staging
#git checkout --orphan environment/production
