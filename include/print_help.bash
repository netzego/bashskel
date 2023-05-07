#!/bin/bash

# shellcheck disable=SC2154
print_help() {
    echo "${BASH_ARGV0} (v$version)"
    echo ""
    echo "-h, --help      print this message"
    echo "-v, --version   print the version and exit"
    echo "-d, --debug     enable debug mode"
    echo "-v, --verbose   enable verbose mode"
}
