#!/bin/bash

source ./project_list.sh
source ./common.sh

# for project in "${LIBRARY_PROJECTS[@]}"; do
for project in "${PROJECTS[@]}"; do
    echo "Pushing $project"
    cd $MONOREPO_BASE/$project
    git push
done

git push