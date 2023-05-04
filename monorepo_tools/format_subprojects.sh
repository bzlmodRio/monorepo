#!/bin/bash

source ./project_list.sh
source ./common.sh


for project in "${LIBRARY_PROJECTS[@]}"; do    
    cd $MONOREPO_BASE/$project/generate
    python3 -m black *.py

    cd $MONOREPO_BASE/$project
    buildifier --lint=fix -r .
done