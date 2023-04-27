#!/bin/bash

set -eo pipefail

readonly scriptdir="$(dirname "$(realpath "${BASH_ARGV0}")")"

source "${scriptdir}/include/vars.in"
source "${scriptdir}/include/func.in"

print_vars() {
	echo "${FUNCNAME[0]}"
	echo "scriptdir: ${scriptdir}"
	echo "scriptname: ${scriptname}"
	echo "pwd: ${pwd}"
	echo "lockfile: ${lockfile}"
	echo "configfile: ${configfile}"
}

main() {
	check_root
	check_lockfile
	print_vars
}

main

exit 0
