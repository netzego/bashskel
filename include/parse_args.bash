#!/bin/bash

# DESC: wraps getopt to parse cli args
# ARGS: $@: arguments from the command line
# NOTE: this function sets global variables. this should be documented some
#       were. and it is your responsibility.
# shellcheck disable=SC2154,SC2034
parse_args() {
    local name="${f_red}***${a_norm} ${SCRIPTNAME}"
    temp=$(getopt -o "hvdl:f:b:" -l "help,verbose,debug,logfile:,foo:,bar:,version" -n "${name}" -- "$@")

    # `$temp` MUST not be a local variable! otherwise this will NOT work
    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        exit 2
    fi

    # ensures `--` is set in $@. `$temp` **must** be quoted.
    eval set -- "$temp"
    unset temp

    while true; do
        case "$1" in
        "-h" | "--help")
            readonly HELP=true
            shift
            continue
            ;;
        "--version")
            readonly VERSION=true
            shift
            continue
            ;;
        "-v" | "--verbose")
            readonly VERBOSE=true
            shift
            continue
            ;;
        "-d" | "--debug")
            readonly DEBUG=true
            shift
            continue
            ;;
        "-l" | "--logfile")
            readonly LOGFILE="$2"
            shift 2
            continue
            ;;
        "-f" | "--foo")
            FOO="$2"
            shift 2
            continue
            ;;
        "-b" | "--bar")
            BAR="$2"
            shift 2
            continue
            ;;
        "--")
            shift
            break
            ;;
        *)
            # this should never happens, because the `eval set -- "$temp"`
            # line sets the explicit `--` arguments. which always get catched
            # before this this case statement.
            die 13 "Ooops, this should not happen. Please report this bug."
            ;;
        esac
    done

    # shellcheck disable=SC2124
    readonly POS_ARGS="$@"
}
