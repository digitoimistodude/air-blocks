#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:11:41
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-22 12:37:03
echo "${YELLOW}Copying block files to the theme folder of the project: ${PROJECTS_HOME}/${PROJECT_NAME}/content/themes/${THEME_NAME}${TXTRESET}"

# Create blocks directory if it does not exist
mkdir -p ${PROJECT_THEME_PATH}/template-parts/blocks

# ACF related tasks
source ${SCRIPTS_LOCATION}/tasks/acf.sh

if [[ $IS_NEW_BLOCK =~ "yes" ]] ; then
  source ${SCRIPTS_LOCATION}/tasks/create-empty-block.sh
else
  source ${SCRIPTS_LOCATION}/tasks/create-predefined-block.sh
fi

# Tasks that should be run after block-specific tasks
if [[ $IS_NEW_BLOCK =~ "yes" ]] ; then
  source ${SCRIPTS_LOCATION}/tasks/post-block-empty-block.sh
else
  source ${SCRIPTS_LOCATION}/tasks/post-block.sh
fi

# Check if renamed block
if [[ $IS_RENAMED_BLOCK =~ "yes" ]]; then
  # Run rename task
  source ${SCRIPTS_LOCATION}/tasks/rename.sh
fi

# Ensure file permissions for ACF folder
source ${SCRIPTS_LOCATION}/tasks/permissions.sh
