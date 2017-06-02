#!/bin/bash

yarn_node_modules() {
    local build_dir=${1:-}
    echo "yarn install..."
    cd "$build_dir"
    yarn install --pure-lockfile --ignore-engines 2>&1
}

npm_node_modules() {
    local build_dir=${1:-}
    if [ -e $build_dir/package.json ]; then
        echo "npm install..."
        cd $build_dir
        npm install --unsafe-perm --userconfig $build_dir/.npmrc 2>&1
    else
        echo "Skipping (no package.json)"
    fi
}
