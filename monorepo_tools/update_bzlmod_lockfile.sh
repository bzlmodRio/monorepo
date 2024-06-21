#!/bin/bash
# set -e

source ./project_list.sh
source ./common.sh

FAILURES=""

for project in "${PROJECTS[@]}"; do   
    echo "Running $project"
    cd $MONOREPO_BASE/$project
    bazel build //... --nobuild --enable_bzlmod --lockfile_mode=update -k
    if [ $? -ne 0 ]; then
        echo "Failed"
        FAILURES="$FAILURES $project"
    fi
    bazel shutdown
    
    cd $MONOREPO_BASE/$project/tests
    bazel build //... --nobuild --enable_bzlmod --lockfile_mode=update -k
    if [ $? -ne 0 ]; then
        echo "Failed"
        FAILURES="$FAILURES $project"
    fi
    bazel shutdown
done

echo "Failed: " $FAILURES