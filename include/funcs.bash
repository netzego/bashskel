#!/bin/bash

# DESC: prints $@ to stdout
# ARGS: $@: messages to print
# shellcheck disable=2154
log() {
    echo -e "${a_bold}>>>${a_norm}" "$*"
}

# DESC: prints $@ to stderr and exit with return value 128
# ARGS: $@: messages to print
# shellcheck disable=2154
die() {
    echo -e "${f_red}***${a_norm}" "$*" >&2
    exit 128
}

# DESC: Loads $PWD/$SCRIPTNAME.config file
# ARGS: None
# shellcheck disable=SC2154,SC1090
load_configfile() {
    if [ -e "${CONFIGFILE}" ]; then
        source "${CONFIGFILE}"
    else
        echo "\`${CONFIGFILE}' not found" >&2
        exit 1
    fi
}
