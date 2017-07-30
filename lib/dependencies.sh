#!/bin/bash

function yarn_node_modules() {
	local build_dir="${1:-}"
	echo "yarn install"
	cd "$build_dir"
	yarn install --pure-lockfile --ignore-engines 2>&1
}

function npm_node_modules() {
	local build_dir="${1:-}"
	if [ -e "$build_dir"/package.json ]; then
		echo "npm install"
		cd "$build_dir"
		npm install --unsafe-perm --userconfig "$build_dir"/.npmrc 2>&1
	else
		echo "Skipping (no package.json)"
	fi
}

function save_subprojects_dependencies() {
	local build_dir="${1:-}"

	for file in "$build_dir/"*; do
		if [[ -d "$file" && -f "$file/package.json" ]]; then
			if [[ -d "$file/node_modules" ]]; then
				mv "$file/node_modules" "$file/.node_modules"
			fi
		fi
	done
}

function check_subproject_dependencies() {
	local build_dir="${1:-}"

	for file in "$build_dir/"*; do
		if [[ -d "$file" && -d "$file/.node_modules" ]]; then
			if [[ ! -d "$file/node_modules" ]]; then
				mv "$file/.node_modules" "$file/node_modules"
			fi
		fi
	done
}

function restore_subprojects() {
	local build_dir="${1:-}"

	for file in "$build_dir/"*; do
		if [[ -d "$file" && -d "$file/.node_modules" ]]; then
			rm -r "$file/node_modules" 2>/dev/null || true
			mv "$file/.node_modules" "$file/node_modules"
		fi
	done
}
