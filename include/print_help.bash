#!/bin/bash

# shellcheck disable=SC2154
print_help() {
    echo "${SCRIPTNAME} (v${VERSION_NUMBER})"
    echo ""
    echo "-h, --help        print this message"
    echo "    --version     print the version and exit"
    echo "-d, --debug       enable debug mode"
    echo "-v, --verbose     enable verbose mode"

    exit 42
}
