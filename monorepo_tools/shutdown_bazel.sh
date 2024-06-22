#!/bin/bash

source ./project_list.sh
source ./common.sh


clean_if_exists() {
    if [ -d $1 ] ; then
        if [ -d $1/bazel-bin ]; then
            cd $1
            bazel shutdown
        else
            echo "$1 seems clean...."
        fi
    else
        echo "$1 does not exist, not cleaning"
    fi
}


for project in "${PROJECTS[@]}"; do
    clean_if_exists "$MONOREPO_BASE/$project"
    clean_if_exists "$MONOREPO_BASE/$project/tests"
    clean_if_exists "$MONOREPO_BASE/$project/generate"
done