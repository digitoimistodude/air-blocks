#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:23:24
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-01-11 17:06:47
export BLOCK_DISPLAY_NAME="hero"
echo "${YELLOW}Copying ${BLOCK_DISPLAY_NAME} block assets...${TXTRESET}"

# The block file
cp -nv ${AIRBLOCKS_THEME_PATH}/template-parts/blocks/${BLOCK_DISPLAY_NAME}.php ${PROJECT_THEME_PATH}/template-parts/blocks/

# JavaScript dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/js/src/modules/100vh.js ${PROJECT_THEME_PATH}/js/src/modules/100vh.js

# Styles for block
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/blocks/_${BLOCK_DISPLAY_NAME}.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/

# Style component dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_prefix.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_heading-hero.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/

# Import block styles to _blocks.scss
sed -e "/\/\/ ACF blocks/a\\
  @import 'gutenberg/blocks/hero';" < ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks.scss > ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks2.scss
rm ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks.scss && mv ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks2.scss ${AIRBLOCKS_THEME_PATH}/sass/gutenberg/_blocks.scss

# Block icon
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/block-icons/${BLOCK_DISPLAY_NAME}.svg ${PROJECT_THEME_PATH}/svg/block-icons/

# Other SVG icons needed by this block
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/play.svg ${PROJECT_THEME_PATH}/svg/

# Import ACF fields
cp -nv ${AIRBLOCKS_THEME_PATH}/acf-json/group_618bb10852874.json ${PROJECT_THEME_PATH}/acf-json/
