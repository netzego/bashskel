#!/bin/bash
# shellcheck disable=SC2034

readonly PWD="$(pwd)"
readonly SCRIPTNAME="$(basename "${BASH_ARGV0%.*}")"
readonly VERSION="0"
readonly LOCKFILE="/tmp/${SCRIPTNAME}.lock"
readonly CONFIGFILE="${PWD}/${SCRIPTNAME}.config"
