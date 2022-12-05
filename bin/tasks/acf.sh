#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:26:55
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-01-11 17:16:01

# Let's ensure we have acf-json folder
mkdir -p ${PROJECT_THEME_PATH}/acf-json

# Ensure file permissions for that folder
source ${SCRIPTS_LOCATION}/tasks/permissions.sh

# Check if block is registered with the same name
if grep -Fxq ${BLOCK_NAME} ${PROJECT_THEME_PATH}/functions.php
then
  echo "${RED}Found exactly the same block name registered in functions.php... The script will now quit.${TXTRESET}" 1>&2
  exit
else
  echo " "
fi
