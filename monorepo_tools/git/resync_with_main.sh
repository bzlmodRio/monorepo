#!/bin/bash

source ./project_list.sh
source ./common.sh

for project in "${PROJECTS[@]}"; do  
    cd $MONOREPO_BASE/$project
    echo -e "\n\nChecking $project"

    # Check for local changes and bail if anythign is different
    git diff HEAD --exit-code &> /dev/null
    if [ $? -ne 0 ]; then
        echo "$project has local changes"
        FAILURES="$FAILURES $project"
        continue
    fi

    git merge --ff-only origin/main &> /dev/null
    
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
    
    git merge --ff-only origin/main &> /dev/null
    
    git diff origin/main --exit-code &> /dev/null
    if [ $? -ne 0 ]; then
        echo "$project has differences from main"
        FAILURES="$FAILURES $project"
        continue
    fi
done

echo $FAILURES