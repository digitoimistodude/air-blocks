#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:11:41
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-08 15:19:43
echo "${YELLOW}Checking block updates...${TXTRESET}"
cd $HOME
git clone https://github.com/digitoimistodude/air-blocks $BLOCKS_PATH_TEMP
cd $BLOCKS_PATH_TEMP
git stash
git pull
echo "${YELLOW}Copying block files to the theme folder of the project: ${PROJECTS_HOME}/${PROJECT_NAME}/content/themes/${THEME_NAME}${TXTRESET}"

# Create blocks directory if it does not exist
mkdir -p ${PROJECT_THEME_PATH}/template-parts/blocks

# ACF related tasks
source ${SCRIPTS_LOCATION}/tasks/acf.sh

# All the typical tasks that we do in every single block
# Checking if block already exists
if [ -f "${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_NAME}.php" ]; then
  echo "
${RED}Block already exists. The newtheme script will now quit...${TXTRESET}
"
  exit
else
  echo "${YELLOW}Copying ${BLOCK_NAME} block assets...${TXTRESET}"

  # The block file
  cp -nv ${AIRBLOCKS_THEME_PATH}/template-parts/blocks/${BLOCK_NAME}.php ${PROJECT_THEME_PATH}/template-parts/blocks/

  # Styles for block
  cp -nv ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/blocks/_${BLOCK_NAME}.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/

  # Import block styles to _blocks.scss
  sed -e "/\/\/ ACF blocks/a\\
    @import 'gutenberg/blocks/${BLOCK_NAME}';" < ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks.scss > ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks_with_changes.scss
  rm ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks.scss
  mv ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks_with_changes.scss ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks.scss

  # Block icon
  mkdir -p ${PROJECT_THEME_PATH}/svg/block-icons
  cp -nv ${AIRBLOCKS_THEME_PATH}/svg/block-icons/${BLOCK_NAME}.svg ${PROJECT_THEME_PATH}/svg/block-icons/
fi

# Start block import script
if [ -f "${SCRIPTS_LOCATION}/blocks/${BLOCK_NAME}.sh" ]; then
  source ${SCRIPTS_LOCATION}/blocks/${BLOCK_NAME}.sh
else
  echo "Block called $BLOCK_NAME does not exist (yet) in the importer script. Or perhaps you mistyped it?"
  exit
fi

# Run required things after the block/<block>.sh
# (like localization.sh that needs to be run after the <block>.sh
# because it gets variables from that file)

# Localizations
echo "${BOLDYELLOW}Importing ACF fields (json)...${TXTRESET} "

# Check if translations are needed
if [[ ${AIR_BLOCKS_LANG} = "en" ]]; then
  # Run localization task
  source ${SCRIPTS_LOCATION}/tasks/localization.sh
fi

# Just import the ACF fields file
cp -nv ${BLOCK_ACF_JSON_PATH} ${PROJECT_THEME_PATH}/acf-json/
