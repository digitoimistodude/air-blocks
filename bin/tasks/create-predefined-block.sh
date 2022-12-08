#!/bin/bash
# All the typical tasks that we do in every single block
# Checking if block already exists
if [[ -f "${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG}.php" && -f "${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG_TO_RENAME_TO}.php" ]] ; then
    echo "
${RED}Block already exists. The newtheme script will now quit...${TXTRESET}
  "
    exit
else
  echo "${YELLOW}Copying ${BLOCK_SLUG} block assets...${TXTRESET}"

  # The block file
  cp -nv ${AIRBLOCKS_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG}.php ${PROJECT_THEME_PATH}/template-parts/blocks/

  # Styles for block
  cp -nv ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/blocks/_${BLOCK_SLUG}.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/

  # Import block styles to _blocks.scss
  sed -e "/\/\/ ACF blocks/a\\
  @import 'gutenberg/blocks/${BLOCK_SLUG}';" < ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss > ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks_with_changes.scss
  rm ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss
  mv ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks_with_changes.scss ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss

  # Block icon
  mkdir -p ${PROJECT_THEME_PATH}/svg/block-icons
  cp -nv ${AIRBLOCKS_THEME_PATH}/svg/block-icons/${BLOCK_SLUG}.svg ${PROJECT_THEME_PATH}/svg/block-icons/
fi

# Start block import script
if [ -f "${SCRIPTS_LOCATION}/blocks/${BLOCK_SLUG}.sh" ]; then
  source ${SCRIPTS_LOCATION}/blocks/${BLOCK_SLUG}.sh
else
  echo "
${RED}Block called $BLOCK_SLUG does not exist (yet) in the importer script. Or perhaps you mistyped it?"
  exit
fi
