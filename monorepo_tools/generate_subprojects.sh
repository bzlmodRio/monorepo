#!/bin/bash
# set -e

source ./project_list.sh
source ./common.sh

BAZEL_ARGS=" --noenable_bzlmod --enable_workspace"

# GEN_ARGS="--use_local_rules_pmd --use_local_rules_checkstyle --use_local_rules_wpiformat --use_local_rules_spotless --use_local_rules_wpi_styleguide"
GEN_ARGS=""


# for project in "${LIBRARY_PROJECTS[@]}"; do    
for project in "${PROJECTS[@]}"; do    
    GENERATION_DIR=$MONOREPO_BASE/$project/generate
    if [ -f $GENERATION_DIR/generate.py ] ; then
        echo "Generating $project"
        cd $GENERATION_DIR
        bazel run $BAZEL_ARGS //:generate -- $GEN_ARGS 2> /dev/null
        err=$?
        bazel shutdown
        if [[ $err -ne 0 ]]; then
            echo "FAILED $err"
            exit $err
        fi;
        
        cd $MONOREPO_BASE/$project
        buildifier  -warnings all --lint=fix -r .
    else
        echo "Project $project does not seem generate-able"
    fi;
done