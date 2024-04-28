#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${LIBRARY_PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    branch_name=`git rev-parse --abbrev-ref HEAD`
    python3 $MONOREPO_BASE/monorepo_tools/git/create_pull_requests.py $project $branch_name "Use explicit build files for downloaded artifacts"
done
