#!/bin/bash

# DESC: Check if effective UID is equal `0`
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
		echo "\`${lockfile}' not found" >&2
		exit 1
	fi
}

# DESC: Check if $pwd/$scriptname.config file exists
# ARGS: None
# shellcheck disable=2154
check_configfile() {
	if [ -e "${configfile}" ]; then
		echo "\`${configfile}' not found" >&2
		exit 1
	fi
}
