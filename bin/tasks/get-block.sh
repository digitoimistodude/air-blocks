#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:11:41
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-22 12:37:03
echo "${YELLOW}Checking block updates...${TXTRESET}"
cd $HOME
git clone https://github.com/digitoimistodude/air-blocks $BLOCKS_PATH_TEMP
cd $BLOCKS_PATH_TEMP
git stash
git clean -fxd
if ! git pull
then
  echo "${RED}Error: git pull failed! Cannot get updates. Make sure you don't have modifications in $BLOCKS_PATH_TEMP.${TXTRESET}"
  exit
fi
git pull

echo "${YELLOW}Copying block files to the theme folder of the project: ${PROJECTS_HOME}/${PROJECT_NAME}/content/themes/${THEME_NAME}${TXTRESET}"

# Create blocks directory if it does not exist
mkdir -p ${PROJECT_THEME_PATH}/template-parts/blocks

# ACF related tasks
source ${SCRIPTS_LOCATION}/tasks/acf.sh

if [[ $IS_NEW_BLOCK =~ "yes" ]] ; then
  source ${SCRIPTS_LOCATION}/tasks/create-empty-block.sh
else

  # All the typical tasks that we do in every single block
  # Checking if block already exists
  if [[ -f "${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_NAME}.php" && -f "${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_NAME_TO_RENAME_TO}.php" ]] ; then
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
    @import 'gutenberg/blocks/${BLOCK_NAME}';" < ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss > ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks_with_changes.scss
    rm ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss
    mv ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks_with_changes.scss ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss

    # Block icon
    mkdir -p ${PROJECT_THEME_PATH}/svg/block-icons
    cp -nv ${AIRBLOCKS_THEME_PATH}/svg/block-icons/${BLOCK_NAME}.svg ${PROJECT_THEME_PATH}/svg/block-icons/
  fi

  # Start block import script
  if [ -f "${SCRIPTS_LOCATION}/blocks/${BLOCK_NAME}.sh" ]; then
    source ${SCRIPTS_LOCATION}/blocks/${BLOCK_NAME}.sh
  else
    echo "
${RED}Block called $BLOCK_NAME does not exist (yet) in the importer script. Or perhaps you mistyped it?"
    exit
  fi
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
