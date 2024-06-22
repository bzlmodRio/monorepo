#!/bin/bash
# set -e

source ./project_list.sh
source ./common.sh

# GEN_ARGS="--use_local_rules_pmd --use_local_rules_checkstyle --use_local_rules_wpiformat --use_local_rules_spotless --use_local_rules_wpi_styleguide"
GEN_ARGS=""


# for project in "${LIBRARY_PROJECTS[@]}"; do    
for project in "${PROJECTS[@]}"; do    
    GENERATION_DIR=$MONOREPO_BASE/$project/generate
    if [ -f $GENERATION_DIR/generate.py ] ; then
        echo "Generating $project"
        cd $GENERATION_DIR
        bazel run //:generate -- $GEN_ARGS 2> /dev/null
        err=$?
        if [[ $err -ne 0 ]]; then
            echo "FAILED"
            # exit $err
        fi;
        bazel shutdown
        
        cd $MONOREPO_BASE/$project
        buildifier  -warnings all --lint=fix -r .
    else
        echo "Project $project does not seem generate-able"
    fi
done