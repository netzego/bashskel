#!/bin/bash

# Setting the default values. Values are might got a value from the
# configfile and thus should NOT be written.
declare -g HELP=false
declare -g VERSION=false
declare -g DEBUG="${DEBUG:-false}"
declare -g VERBOSE="${VERBOSE:-false}"
declare -g LOGFILE="${LOGFILE:-/dev/null}"
declare -g POS_ARGS=()
# example vars; delete/change them
declare -g FOO="${FOO:-abc}"
declare -g BAR="${BAR:-xyz}"

# DESC: make global args readonly
# ARGS: none
readonly_args() {
    declare -gr HELP
    declare -gr VERSION
    declare -gr DEBUG
    declare -gr VERBOSE
    declare -gr LOGFILE
    declare -gr POS_ARGS
    # example vars; delete/change them
    declare -gr FOO
    declare -gr BAR
}

# DESC: exit if string do NOT start with a hyphen
# ARGS: $1: string to test
exif_startwith_hyphen() {
    declare -r arg="$1"

    if [ "${arg:0:1}" = "-" ]; then
        die 2 "\`${arg}' start with a hyphen. did you forget an argument?"
    fi
}

# DESC: wraps getopt to parse cli arguments and sets global parameters
# ARGS: $@: arguments from the cli
# NOTE: an example is found here /usr/share/doc/util-linux
# shellcheck disable=SC2154,SC2034
parse_args() {
    declare -r name="${f_red}***${a_norm} ${SCRIPTNAME}"
    # `declare temp=$(...)` declaration and assignment in one statement overwrites
    # the return value (`$?`) from the subshell!
    declare temp
    temp=$(getopt -o "hvdl:f:b:" -l "help,verbose,debug,logfile:,foo:,bar:,version" -n "${name}" -- "$@")

    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        exit 2
    fi

    # ensures `--` is set in `$@` (the args array from this function)
    eval set -- "${temp}"
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
            exif_startwith_hyphen "$2"
            LOGFILE="$2"
            shift 2
            continue
            ;;
        "-f" | "--foo")
            exif_startwith_hyphen "$2"
            FOO="$2"
            shift 2
            continue
            ;;
        "-b" | "--bar")
            exif_startwith_hyphen "$2"
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
            # line sets `--` explicit inside `$@`. `--` will always get catched
            # before this this case statement and break this loop.
            die 13 "Ooops, this should not happen. Please report this bug."
            ;;
        esac
    done

    # this does NOT work without braces
    POS_ARGS=("$@")

    # make global vars ro
    readonly_args
}
