#!/bin/bash

HELP=false
VERSION=false
DEBUG=false
VERBOSE=false
POS_ARGS=()
LOGFILE="${LOGFILE:-/dev/null}"
FOO="${FOO:-abc}"
BAR="${BAR:-xyz}"

# DESC: make global args readonly
# ARGS: none
readonly_args() {
    readonly HELP
    readonly VERSION
    readonly DEBUG
    readonly VERBOSE
    readonly POS_ARGS
    readonly LOGFILE
    readonly FOO
    readonly BAR
}

# DESC: wraps getopt to parse cli arguments and sets global parameters
# ARGS: $@: arguments from the cli
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
            HELP=true
            shift
            continue
            ;;
        "--version")
            VERSION=true
            shift
            continue
            ;;
        "-v" | "--verbose")
            VERBOSE=true
            shift
            continue
            ;;
        "-d" | "--debug")
            DEBUG=true
            shift
            continue
            ;;
        "-l" | "--logfile")
            LOGFILE="$2"
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
    POS_ARGS="$@"

    readonly_args
}
