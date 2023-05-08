#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    git tag -f 2024.DUMMY; git push origin 2024.DUMMY -f
done
