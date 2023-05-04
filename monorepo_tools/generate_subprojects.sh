#!/bin/bash -e
set -e

source ./project_list.sh
source ./common.sh


for project in "${LIBRARY_PROJECTS[@]}"; do    
    echo "Generating $project"
    cd $MONOREPO_BASE/$project/generate
    bazel run //:generate -- --force_tests && buildifier --lint=fix -r .. 
    err=$?
    echo "CODE----------------- $err"
    if [[ $err -ne 0 ]]; then
        echo "FAILED"
        exit $err
    fi;
    
    cd $MONOREPO_BASE/$project
    buildifier --lint=fix -r .
done