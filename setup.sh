#!/bin/bash

## ---------------------------------------------------------------------------##
## setup
## ---------------------------------------------------------------------------##

# params
HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# find the location of custom files
CONF_DIR=$(jupyter --config-dir)
CUST_DIR="${CONF_DIR}/custom"

mkdir -p ${CUST_DIR}

## ---------------------------------------------------------------------------##
## css files
## ---------------------------------------------------------------------------##

# back up existing css file if it exists
CSS_FILE="${CUST_DIR}/custom.css"
if [ -f "${CSS_FILE}" ]; then
    tmstmp=$(date "+%Y%m%d%H%M")
    cp $CSS_FILE "${CSS_FILE}.${tmstmp}.bak"
fi

# symlink for css file
ln -fs "${HERE}/custom.css" $CSS_FILE
