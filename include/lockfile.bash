#!/bin/bash

# DESC: exit early if $LOCKFILE exists. ensures only one instance is running
# ARGS: None
check_lockfile() {
    if [ -e "${LOCKFILE}" ]; then
        die 1 "\`${LOCKFILE}' exists"
    fi
}

# DESC: creates $LOCKFILE
# ARGS: None
create_lockfile() {
    touch "${LOCKFILE}"
}

# DESC: deletes $LOCKFILE
# ARGS: None
delete_lockfile() {
    if [ -e "${LOCKFILE}" ]; then
        rm -v "${LOCKFILE}"
    fi
}
