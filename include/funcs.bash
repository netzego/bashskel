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
