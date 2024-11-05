#!/bin/bash

source ./project_list.sh
source ./common.sh

REFACTOR_DEV_PROJECTS=("${RULES_PROJECTS[@]}" "${LIBRARY_PROJECTS[@]}" )

for project in "${REFACTOR_DEV_PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    pwd
    git checkout refactor_dev
done
