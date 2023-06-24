#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    git --no-pager dno origin/main --exit-code > /dev/null
    if [ $? -ne 0 ]; then
        echo "$project has differences"
        FAILURES="$FAILURES $project"
    fi
done
