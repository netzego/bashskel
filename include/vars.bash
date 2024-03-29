#!/bin/bash
# shellcheck disable=SC2034

declare -rg SCRIPTNAME="$(basename "${BASH_ARGV0%.*}")"
declare -rg VERSION_NUMBER="0"
declare -rg LOCKFILE="/tmp/${SCRIPTNAME}.lock"
declare -rg CONFIGFILE="${SCRIPTDIR}/${SCRIPTNAME}.config"
