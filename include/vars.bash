#!/bin/bash
# shellcheck disable=SC2034

readonly pwd="$(pwd)"
readonly scriptname="$(basename "${BASH_ARGV0%.*}")"
readonly lockfile="/tmp/${scriptname}.lock"
readonly configfile="${pwd}/${scriptname}.config"
