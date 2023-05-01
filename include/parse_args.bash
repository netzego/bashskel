#!/bin/bash

# DESC: wraps getopt to parse cli args
# ARGS: $@: arguments from the command line
# NOTE: sets globa vars. such as $action, $pargs, etc.
parse_args() {
	local name="${f_red}***${a_norm} ${scriptname}"
	temp=$(getopt -o "hvdm:" -l "help,version,debug,mode:" -n "${name}" -- "$@")

	# `$temp` MUST not be a local variable! otherwise this will NOT work
	if [ $? -ne 0 ]; then
		exit 2
	fi

	# `$temp` MUST be quoted!
	eval set -- "$temp"
	unset temp

	while true; do
		case "$1" in
		"-h" | "--help")
			readonly action="help"
			shift
			continue
			;;
		"-v" | "--version")
			readonly action="version"
			shift
			continue
			;;
		"-d" | "--debug")
			readonly debug=true
			shift
			continue
			;;
		"-m" | "--mode")
			readonly mode="${2}"
			shift 2
			continue
			;;
		"--")
			shift
			break
			;;
			# *)
			#     die "err: parse_args"
			# ;;
		esac
	done

	readonly pargs="$*"
}
