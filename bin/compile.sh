#!/bin/bash
# bin/compile <build-dir> <cache-dir> <env-dir>

set -e

### Configure directories

BUILD_DIR=${1:-}
CACHE_DIR=${2:-}
ENV_DIR=${3:-}

BP_DIR=$(cd $(dirname ${0:-}); cd ..; pwd)

### Load dependencies

header "Load dependencies"

source $BP_DIR/lib/output.sh
source $BP_DIR/lib/environment.sh
source $BP_DIR/lib/dependencies.sh

### Runtime environment

header "Runtime environment"

export_env_dir "$ENV_DIR" | indent

### Check initial state

[ -f "$BUILD_DIR/yarn.lock" ] && YARN=true || YARN=false

### Set up development

info "Set up development"

_NPM_CONFIG_PRODUCTION_=${NPM_CONFIG_PRODUCTION:-true}
_NODE_ENV_=${NODE_ENV:-'production'}

export NPM_CONFIG_PRODUCTION=false
export NODE_ENV='development'

### Restore /node_modules/

restore_dependencies() {
    if $YARN; then
        yarn_node_modules "$BUILD_DIR"
    else
        npm_node_modules "$BUILD_DIR"
    fi
}

header "Restore /node_modules/"
restore_dependencies | indent

### Build-step

build_step() {
    cd "$BUILD_DIR"

    info "set NODE_ENV=Production"
    export NODE_ENV='production'
    
    # execute build step
    info "npm run build"
    npm run build
}

header "Build-step"
build_step

### Restore environmet

info "Restore environment"

export NPM_CONFIG_PRODUCTION=$_NPM_CONFIG_PRODUCTION_
export NODE_ENV=$_NODE_ENV_
