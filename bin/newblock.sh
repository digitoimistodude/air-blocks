#!/bin/bash
# Block automation script for Air-light
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:06:59
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-08-24 14:40:21

# Script specific vars
SCRIPT_LABEL='for macOS'
SCRIPT_VERSION='1.2.1 (2022-08-24)'

# Vars needed for this file to function globally
CURRENTFILE=`basename $0`

# Determine scripts location to get imports right
if [ "$CURRENTFILE" = "newblock.sh" ]; then
  SCRIPTS_LOCATION="$( pwd )"
  source ${SCRIPTS_LOCATION}/tasks/variables.sh
  source ${SCRIPTS_LOCATION}/tasks/header.sh
  exit
else
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
  ORIGINAL_FILE=$( readlink $DIR/$CURRENTFILE )
  SCRIPTS_LOCATION=$( dirname $ORIGINAL_FILE )
fi

# Final note about server requirements
echo ""
echo "${WHITE}Using this start script requires you use the following:
https://github.com/digitoimistodude/macos-lemp-setup
https://github.com/digitoimistodude/air-light
${TXTRESET}"

# Import required tasks
source ${SCRIPTS_LOCATION}/tasks/imports.sh

# Replace Air-light and Air-blocks with your theme name
# source ${SCRIPTS_LOCATION}/tasks/replaces.sh

# The end
source ${SCRIPTS_LOCATION}/tasks/footer.sh
