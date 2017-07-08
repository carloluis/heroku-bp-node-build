#!/bin/bash

info() {
	echo "       $*" || true
}

header() {
	echo "" || true
	echo "-----> $*" || true
}

indent() {
	sed -u 's/^/       /'
}

print() {
	echo "$*" | indent
}
