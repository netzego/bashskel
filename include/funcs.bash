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

# DESC: Check if $UID is equal 0
# ARGS: None
check_root() {
	if [ $UID -ne 0 ]; then
		echo "must run as root" >&2
		exit 1
	fi
}

# DESC: Check if $lockfile exists to prevent running multiple instances
# ARGS: None
# shellcheck disable=2154
check_lockfile() {
	if [ -e "${lockfile}" ]; then
		echo "\`${lockfile}' exists" >&2
		exit 1
	fi
}

# DESC: Loads $pwd/$scriptname.config file
# ARGS: None
# shellcheck disable=SC2154,SC1090
load_configfile() {
	if [ -e "${configfile}" ]; then
		source "${configfile}"
	else
		echo "\`${configfile}' not found" >&2
		exit 1
	fi
}
