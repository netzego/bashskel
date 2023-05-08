#!/bin/bash

# shellcheck disable=SC2154
print_help() {
    echo "${SCRIPTNAME} (v${VERSION_NUMBER})"
    echo ""
    echo "-h, --help        print this help message"
    echo "    --version     print the version number"
    echo "-d, --debug       set debug flag"
    echo "-v, --verbose     set verbose flag"

    exit 42
}
