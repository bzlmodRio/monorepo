#!/bin/bash

source ../project_list.sh
source ../common.sh

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    git tag -l | xargs git tag -d
done
