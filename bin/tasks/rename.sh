#!/bin/bash
echo "${YELLOW}Renaming block to '${BLOCK_SLUG_TO_RENAME_TO}'...${TXTRESET}"
mv ${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG}.php ${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG_TO_RENAME_TO}.php
mv ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/_${BLOCK_SLUG}.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/_${BLOCK_SLUG_TO_RENAME_TO}.scss
mv ${PROJECT_THEME_PATH}/svg/block-icons/${BLOCK_SLUG}.svg ${PROJECT_THEME_PATH}/svg/block-icons/${BLOCK_SLUG_TO_RENAME_TO}.svg

# Renaming block names in files
sed -i '' -e "s;@import 'gutenberg/blocks/${BLOCK_SLUG}';@import 'gutenberg/blocks/${BLOCK_SLUG_TO_RENAME_TO}';" ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss

# Rename only block slug in functions.php
sed -i '' -e "s;'name' => '${BLOCK_SLUG}';'name' => '${BLOCK_SLUG_TO_RENAME_TO}';" ${PROJECT_THEME_PATH}/functions.php

# Renaming block UI label
sed -i '' -e "s/'title' \=\> '${BLOCK_UI_TITLE}',/'title' \=\> '${BLOCK_UI_TITLE_TO_RENAME_TO}',/" ${PROJECT_THEME_PATH}/functions.php

# Renaming block UI name in ACF
if [[ ${AIR_BLOCKS_LANG} = "fi" ]]; then
  sed -i '' -e "s/\"title\"\: \"Lohko\: .*\"\,/\"title\"\: \"Lohko\: ${BLOCK_UI_TITLE_TO_RENAME_TO}\"\,/" ${PROJECT_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}
else
  sed -i '' -e "s/\"title\"\: \"Block\: .*\"\,/\"title\"\: \"Block\: ${BLOCK_UI_TITLE_TO_RENAME_TO}\"\,/" ${PROJECT_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}
fi
