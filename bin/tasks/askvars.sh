#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:09:25
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-07 15:18:21

# Ask block name
echo "${BOLDYELLOW}Block name in lowercase (the one filtered in blocks.airwptheme.com):${TXTRESET} "

# Show available blocks
source ${SCRIPTS_LOCATION}/tasks/blocks-available.sh

# Read given block name
read -e BLOCK_NAME

# Ask project name
echo "
${BOLDYELLOW}Project name in lowercase:${TXTRESET} "

# Read given project name
read -e PROJECT_NAME

# Ask theme name
echo "
${BOLDYELLOW}Theme name in lowercase (no spaces or special characters):${TXTRESET} "

# Read given theme name
read -e THEME_NAME

# Add these variables based on asked vars
export PROJECT_PATH="${PROJECTS_HOME}/${PROJECT_NAME}"
export PROJECT_THEME_PATH="${PROJECTS_HOME}/${PROJECT_NAME}/content/themes/${THEME_NAME}"
