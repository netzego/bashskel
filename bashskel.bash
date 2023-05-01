#!/bin/bash

set -eo pipefail

readonly scriptdir="$(dirname "$(realpath "${BASH_ARGV0}")")"

source "${scriptdir}/include/colors.bash"
source "${scriptdir}/include/vars.bash"
source "${scriptdir}/include/funcs.bash"
source "${scriptdir}/include/parse_args.bash"

print_vars() {
	log "${FUNCNAME[0]}"
	log "scriptdir: ${scriptdir}"
	log "scriptname: ${scriptname}"
	log "pwd: ${pwd}"
	log "lockfile: ${lockfile}"
	log "configfile: ${configfile}"
}

main() {
	# check_root
	check_lockfile
	load_configfile
	print_vars
}

main

exit 0
