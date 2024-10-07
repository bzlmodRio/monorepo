#!/bin/bash

source ./project_list.sh
source ./common.sh

if [ "$#" -ne 1 ]; then
    echo "You must provide PR title"
    exit 1
fi

# PR_PROJECTS=("${RULES_PROJECTS[@]}" "${LIBRARY_PROJECTS[@]}" )
PR_PROJECTS=("${LIBRARY_PROJECTS[@]}" )

# for project in "${LIBRARY_PROJECTS[@]}"; do  
# for project in "${RULES_PROJECTS[@]}"; do  
for project in "${PR_PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    branch_name=`git rev-parse --abbrev-ref HEAD`
    python3 $MONOREPO_BASE/monorepo_tools/git/create_pull_requests.py $project $branch_name "$1"
done
