#!/bin/bash

source ./project_list.sh
source ./common.sh

try_wpiformat() {
    if [ -d $1 ] ; then
        cd $1
        echo "Trying to format $1"
        bazel run @rules_wpiformat//wpiformat -- -f .. 2> /dev/null || true
        bazel run @rules_wpiformat//wpiformat -- -f . 2> /dev/null || true
    fi
}


for project in "${LIBRARY_PROJECTS[@]}"; do    
    cd $MONOREPO_BASE/$project
    # python3 -m autoflake $(git ls-files '*.py') --in-place --remove-unused-variable --remove-all-unused-imports
    # python3 -m black .
    # python3 -m pylint $(git ls-files '*.py')

    try_wpiformat "$MONOREPO_BASE/$project"
    try_wpiformat "$MONOREPO_BASE/$project/tests"

    cd $MONOREPO_BASE/$project
    buildifier --lint=fix -r .
done