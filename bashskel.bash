#!/bin/bash
# shellcheck disable=SC2155

set -eo pipefail

readonly SCRIPTDIR="$(dirname "$(realpath "${BASH_ARGV0}")")"

source "${SCRIPTDIR}/include/colors.bash"
source "${SCRIPTDIR}/include/vars.bash"
source "${SCRIPTDIR}/include/funcs.bash"
source "${SCRIPTDIR}/include/parse_args.bash"
source "${SCRIPTDIR}/include/check_root.bash"
source "${SCRIPTDIR}/include/lockfile.bash"
source "${SCRIPTDIR}/include/load_configfile.bash"
source "${SCRIPTDIR}/include/check_logfile.bash"
source "${SCRIPTDIR}/include/print_usage.bash"
source "${SCRIPTDIR}/include/print_help.bash"
source "${SCRIPTDIR}/include/print_version.bash"
source "${SCRIPTDIR}/include/print_vars.bash"
source "${SCRIPTDIR}/include/cleanup.bash"

# ARGS: $@: cli arguments
# NOTE: stdout and stderr will eventually get logged
main() {
    if [ "${DEBUG}" ]; then
        print_vars
    fi

    # implement your own logic here
}

trap cleanup EXIT

# check_root
load_configfile
parse_args "$@"
check_lockfile
create_lockfile
check_logfile

if [ "${HELP}" ]; then
    print_help
    exit 0
fi

if [ "${VERSION}" ]; then
    print_version
    exit 0
fi

main "$@" 2>&1 | tee "${LOGFILE}"

exit 0
