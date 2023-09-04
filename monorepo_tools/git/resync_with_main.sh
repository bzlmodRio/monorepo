#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    echo -e "\n\nChecking $project"
    git diff HEAD --exit-code &> /dev/null
    if [ $? -ne 0 ]; then
        echo "$project has local changes"
        FAILURES="$FAILURES $project"
        continue
    fi
    
    git diff origin/main --exit-code &> /dev/null
    if [ $? -ne 0 ]; then
        echo "$project has differences from main"
        FAILURES="$FAILURES $project"
        continue
    fi

    git reset --hard origin/main
    git checkout main
    git pull
    git checkout refactor_dev
done

echo $FAILURES