#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:11:41
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2021-11-24 19:08:35
echo "${YELLOW}Checking block updates...${TXTRESET}"
cd $HOME
git clone https://github.com/digitoimistodude/air-blocks $BLOCKS_PATH_TEMP
cd $BLOCKS_PATH_TEMP
git stash
git pull
echo "${YELLOW}Copying block files to the theme folder of the project: ${PROJECTS_HOME}/${PROJECT_NAME}/content/themes/${THEME_NAME}${TXTRESET}"

# Create blocks directory if it does not exist
mkdir -p ${PROJECT_THEME_PATH}/template-parts/blocks

# BLOCKS HERE
if [ "$BLOCK_NAME" == "hero" ]; then
  source ${SCRIPTS_LOCATION}/blocks/hero.sh
elif [ "$BLOCK_NAME" == "cta" ]; then
  source ${SCRIPTS_LOCATION}/blocks/cta.sh
else
  echo "Block called $BLOCK_NAME does not exist (yet). Or perhaps you mistyped it?"
fi
