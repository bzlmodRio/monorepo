#!/bin/bash

source ./project_list.sh
source ./common.sh


for project in "${LIBRARY_PROJECTS[@]}"; do    
    cd $MONOREPO_BASE/$project
    python3 -m autoflake $(git ls-files '*.py') --in-place --remove-unused-variable --remove-all-unused-imports
    python3 -m black .
    # python3 -m pylint $(git ls-files '*.py')

    cd $MONOREPO_BASE/$project
    buildifier --lint=fix -r .
done