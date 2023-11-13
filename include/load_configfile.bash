#!/bin/bash

# DESC: loads $PWD/$SCRIPTNAME.config file
# ARGS: `$1` (optional) a path to a configfile
# EXIT: if no configfile is found
# shellcheck disable=SC2154,SC1090
load_configfile() {
    declare -r configfile="${1:-${CONFIGFILE}}"

    if [ -e "${configfile}" ]; then
        source "${configfile}"
    else
        die 1 "\`${configfile}' not found"
    fi
}
