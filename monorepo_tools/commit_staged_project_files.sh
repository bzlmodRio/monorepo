#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${LIBRARY_PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    git commit -m "Gen stuff"
done
