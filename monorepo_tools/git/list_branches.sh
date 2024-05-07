#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    pwd
    echo "   Got" `git branch | wc -l` "branches"
    echo -e "\n"
    git branch -vv
    echo -e "\n"
done
