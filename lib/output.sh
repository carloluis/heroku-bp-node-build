#!/bin/bash

function info() {
	echo "       $*" || true
}

function header() {
	echo "" || true
	echo "-----> $*" || true
}

function indent() {
	sed -u 's/^/       /'
}

function print() {
	echo "$*" | indent
}
