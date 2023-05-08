#!/bin/bash

# shellcheck disable=SC2154
print_help() {
    echo "${SCRIPTNAME} (v${VERSION})"
    echo ""
    echo "-h, --help      print this message"
    echo "-v, --version   print the version and exit"
    echo "-d, --debug     enable debug mode"
    echo "-v, --verbose   enable verbose mode"

    exit 42
}
