#!/bin/bash

# DESC: prints usage and exit
# ARGV: None
# shellcheck disable=SC2154
usage() {
    echo "usage: ${scriptname} [OPTIONS] <FILE>"

    exit 42
}
