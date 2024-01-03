#!/bin/bash
# set -e

source ./project_list.sh
source ./common.sh


for project in "${PROJECTS[@]}"; do 
    echo "Generating lock file for $project"
    cd $MONOREPO_BASE/$project

    bazel build //... -k --enable_bzlmod --lockfile_mode=update --nobuild 2> /dev/null
    if [ $? -ne 0 ]; then
        FAILURES="$FAILURES $MONOREPO_BASE/$project"
    fi
    bazel shutdown

    GENERATION_DIR=$MONOREPO_BASE/$project/generate
    if [ -d $GENERATION_DIR ] ; then
        cd $GENERATION_DIR
        bazel build //... -k --enable_bzlmod --lockfile_mode=update --nobuild 2> /dev/null
        if [ $? -ne 0 ]; then
            FAILURES="$FAILURES $GENERATION_DIR"
        fi
        bazel shutdown
    else
        echo "  Project $project does not seem generate-able"
    fi

    TEST_DIR=$MONOREPO_BASE/$project/tests
    if [ -d $TEST_DIR ] ; then
        cd $TEST_DIR
        bazel build //... -k --enable_bzlmod --lockfile_mode=update --nobuild 2> /dev/null
        if [ $? -ne 0 ]; then
            FAILURES="$FAILURES $TEST_DIR"
        fi
        bazel shutdown
    else
        echo "  Project $project does not seem to have tests"
    fi
done

echo "Failures: $FAILURES"