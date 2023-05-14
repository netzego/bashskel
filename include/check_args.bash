#!/bin/bash

# DESC: check if path prefix exist.
# ARGS: $1: path to check
# ECHO: boolean
check_path_prefix() {
    local path="$1"
    local prefix="$(realpath "$(dirname "${path}")")"

    if [ -d "${prefix}" ]; then
        echo true
    else
        echo false
    fi
}
