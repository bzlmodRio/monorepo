#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    git push --delete origin 2024.DUMMY
done
