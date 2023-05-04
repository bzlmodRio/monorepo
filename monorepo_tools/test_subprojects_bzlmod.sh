#!/bin/bash

source ./project_list.sh
source ./common.sh


for project in "${LIBRARY_PROJECTS[@]}"; do    
    cd $MONOREPO_BASE/$project
    bazel build //... -k --config=linux --config=remote --enable_bzlmod

    cd $MONOREPO_BASE/$project/tests
    bazel test //... -k --config=linux --config=remote --enable_bzlmod
done