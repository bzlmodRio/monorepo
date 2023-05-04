#!/bin/bash

source ./project_list.sh


FAILURES=""

JOBS=""
JOBS="-j 4"

for project in "${LIBRARY_PROJECTS[@]}"; do    
    cd /home/pjreiniger/git/bzlmodRio/$project
    bazel build //... -k --config=linux --config=remote $JOBS
    if [ $? -ne 0 ]; then
        echo "Failed"
        FAILURES="$FAILURES $project"
    fi

    cd /home/pjreiniger/git/bzlmodRio/$project/tests
    bazel test //... -k --config=linux --config=remote $JOBS
    if [ $? -ne 0 ]; then
        echo "Failed"
        FAILURES="$FAILURES $project/tests"
    fi
done

echo "Failed: " $FAILURES