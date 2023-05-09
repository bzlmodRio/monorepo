#!/bin/bash

source ./project_list.sh
source ./common.sh

git push

for project in "${PROJECTS[@]}"; do
    echo "Pushing $project"
    cd $MONOREPO_BASE/$project
    git push
done