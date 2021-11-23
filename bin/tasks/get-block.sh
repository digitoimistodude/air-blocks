#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:11:41
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2021-11-23 18:24:42
echo "${YELLOW}Checking block updates...${TXTRESET}"
cd $HOME
git clone https://github.com/digitoimistodude/air-blocks $BLOCKS_PATH_TEMP
cd $BLOCKS_PATH_TEMP
git stash
git pull
echo "${YELLOW}Copying block files to the theme folder of the project: ${PROJECTS_HOME}/${PROJECT_NAME}/content/themes/${THEME_NAME}${TXTRESET}"

# BLOCKS HERE
source ${SCRIPTS_LOCATION}/blocks/hero.sh
source ${SCRIPTS_LOCATION}/blocks/cta.sh

# If no such block found
else
  echo "Block called $BLOCK_NAME does not exist (yet). Or perhaps you mistyped it?"
fi
