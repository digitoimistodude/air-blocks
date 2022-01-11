#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:09:15
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-01-11 18:01:46
# Import required variables
source ${SCRIPTS_LOCATION}/tasks/variables.sh

# Script header
source ${SCRIPTS_LOCATION}/tasks/header.sh

# Ask names and credentials
source ${SCRIPTS_LOCATION}/tasks/askvars.sh

# Check if the theme version is supported
source ${SCRIPTS_LOCATION}/tasks/version-check.sh

# Get the block and copy it over to your project
source ${SCRIPTS_LOCATION}/tasks/get-block.sh
