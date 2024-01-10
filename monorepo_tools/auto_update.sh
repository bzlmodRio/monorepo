#!/bin/bash
# set -e

source ./project_list.sh
source ./common.sh


for project in "${PROJECTS[@]}"; do    
    GENERATION_DIR=$MONOREPO_BASE/$project/generate
    if [ -f $GENERATION_DIR/auto_update.py ] ; then
        echo "Generating $project"
        cd $GENERATION_DIR
        bazel run //:auto_update 2> /dev/null
        err=$?
        bazel shutdown
        if [[ $err -ne 0 ]]; then
            echo "Failed to update"
            exit $err
        fi;
        
        bazel run //:generate -- $GEN_ARGS # 2> /dev/null
        err=$?
        bazel shutdown
        if [[ $err -ne 0 ]]; then
            echo "Failed to update"
            exit $err
        fi;
        
        cd $MONOREPO_BASE/$project
        buildifier  -warnings all --lint=fix -r .
    else
        echo "Project $project does not seem generate-able"
    fi
done