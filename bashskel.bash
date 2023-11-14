#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

IFS=$' \n\t' # set `$IFS` to bash default

declare -gr SCRIPTDIR="$(dirname "$(realpath "${BASH_ARGV0}")")"

source "${SCRIPTDIR}/include/colors.bash"
source "${SCRIPTDIR}/include/utils.bash"
source "${SCRIPTDIR}/include/vars.bash"
source "${SCRIPTDIR}/include/cleanup.bash"
source "${SCRIPTDIR}/include/check_root.bash"
source "${SCRIPTDIR}/include/load_configfile.bash"
source "${SCRIPTDIR}/include/parse_args.bash"
source "${SCRIPTDIR}/include/check_args.bash"
source "${SCRIPTDIR}/include/write_lockfile.bash"
source "${SCRIPTDIR}/include/print_help.bash"
source "${SCRIPTDIR}/include/print_version.bash"
source "${SCRIPTDIR}/include/print_usage.bash"
source "${SCRIPTDIR}/include/print_vars.bash"

# DESC: main function
# ARGS: none
# NOTE: stdout and stderr will eventually get logged
main() {
    if [ "${DEBUG}" = true ]; then
        print_vars
    fi

    : # implement your own logic below here
}

# DESC: init function
# ARGS: `$@` (required): command line arguments to parse
init() {
    # shellcheck disable=SC2206
    declare -ra args=("$@")

    # check_root

    load_configfile

    # parse_args "${args[@]}"
    parse_args "${args[@]}"

    # TODO: refactor
    check_args

    # handle --help and --version parameter
    {
        if [ "${HELP}" = true ]; then
            print_help
            exit 0
        fi

        if [ "${VERSION}" = true ]; then
            print_version
            exit 0
        fi
    }

    trap cleanup EXIT

    write_lockfile
}

# the script starts here ;-)
init "$@"
main 2>&1 | tee "${LOGFILE}"

exit 0
