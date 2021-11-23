#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:09:25
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2021-11-23 18:13:52
echo "${BOLDYELLOW}Block name in lowercase (the one filtered in blocks.airwptheme.com):${TXTRESET} "
read -e BLOCK_NAME
echo "${BOLDYELLOW}Project name in lowercase:${TXTRESET} "
read -e PROJECT_NAME
echo "${BOLDYELLOW}Theme name in lowercase (no spaces or special characters):${TXTRESET} "
read -e THEME_NAME

# Add these variables based on asked vars
export PROJECT_PATH="${PROJECTS_HOME}/${PROJECT_NAME}"
export PROJECT_THEME_PATH="${PROJECTS_HOME}/${PROJECT_NAME}/content/themes/${THEME_NAME}"
