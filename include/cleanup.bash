#!/bin/bash

cleanup() {
    # remove $LOCKFILE
    if [ -e "${LOCKFILE}" ]; then
        rm -v "${LOCKFILE}"
    fi
}
