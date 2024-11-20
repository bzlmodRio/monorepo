#!/bin/bash

source ./project_list.sh
source ./common.sh

PUSH_PROJECTS=("${PROJECTS[@]}" "wpilibsuite_gen" )

# for project in "${LIBRARY_PROJECTS[@]}"; do
for project in "${PUSH_PROJECTS[@]}"; do
    echo "Pushing $project"
    cd $MONOREPO_BASE/$project
    git push
done

git push