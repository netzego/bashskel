#!/bin/bash

# DESC: Check if $UID is equal 0
# ARGS: None
check_root() {
    if [ $UID -ne 0 ]; then
        echo "must run as root" >&2
        exit 1
    fi
}
