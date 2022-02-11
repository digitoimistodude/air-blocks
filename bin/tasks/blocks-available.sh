#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-07 15:18:58
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-11 11:03:04

# Show descriptive text for task
echo "
${BOLDGREEN}Available blocks:${TXTRESET} "

# List available blocks and remove white space from the start and .sh extension from the end
ls -1 "${SCRIPTS_LOCATION}/blocks" | nl | awk '{$1=$1};1' | sed -e 's/\.sh$//'
echo "? create new empty block"
