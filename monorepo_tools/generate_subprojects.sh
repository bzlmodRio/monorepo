#!/bin/bash
# set -e

source ./project_list.sh
source ./common.sh


for project in "${PROJECTS[@]}"; do    
    GENERATION_DIR=$MONOREPO_BASE/$project/generate
    if [ -f $GENERATION_DIR/generate.py ] ; then
        echo "Generating $project"
        cd $GENERATION_DIR
        bazel run //:generate # 2> /dev/null
        err=$?
        if [[ $err -ne 0 ]]; then
            echo "FAILED"
            exit $err
        fi;
        
        cd $MONOREPO_BASE/$project
        buildifier --lint=fix -r .
    else
        echo "Project $project does not seem generate-able"
    fi
done