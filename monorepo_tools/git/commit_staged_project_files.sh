#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    # git add .
    git commit -m $1
done
