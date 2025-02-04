#!/bin/bash
CURRENT_BRANCH=$(git branch --show-current)
set -e
git checkout develop
git pull origin develop
git checkout "$CURRENT_BRANCH"
git merge develop
echo "Successfully merged develop into $CURRENT_BRANCH"
