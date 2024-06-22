#!/bin/bash

source ./project_list.sh
source ./common.sh


FAILURES=""

JOBS=""
# JOBS="-j 2"

for project in "${LIBRARY_PROJECTS[@]}"; do
    echo "Building Library $project"
    # cd $MONOREPO_BASE/$project
    # bazel build //... -k --config=linux --noenable_bzlmod --config=remote $JOBS
    # if [ $? -ne 0 ]; then
    #     echo "Failed"
    #     FAILURES="$FAILURES $project"
    # fi
    # bazel shutdown

    cd $MONOREPO_BASE/$project/tests
    bazel test //... -k --config=linux --noenable_bzlmod --config=remote $JOBS
    if [ $? -ne 0 ]; then
        echo "Failed"
        FAILURES="$FAILURES $project/tests"
    fi
    bazel shutdown
done

for project in "${RULES_PROJECTS[@]}"; do  
    echo "Building Rule $project"  
    cd $MONOREPO_BASE/$project
    bazel build //... -k --config=remote --noenable_bzlmod $JOBS
    if [ $? -ne 0 ]; then
        echo "Failed"
        FAILURES="$FAILURES $project"
    fi
    bazel shutdown
done

echo "Failed: " $FAILURES