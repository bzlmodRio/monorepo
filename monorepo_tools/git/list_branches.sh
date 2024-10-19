#!/bin/bash

source ./project_list.sh
source ./common.sh

EXTRA_ARGS=""

clear;

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    pwd
    echo "   Got" `git branch $EXTRA_ARGS | wc -l` "branches"
    echo -e "\n"
    git --no-pager branch $EXTRA_ARGS -vv
    echo -e "\n"
done
