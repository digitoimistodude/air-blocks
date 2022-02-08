#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:23:24
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-08 16:40:34

# // New files/Dependencies (this file will install them):
# // ├── js/src/modules/100vh.js
# // ├── sass/gutenberg/blocks/_hero-big-image.scss
# // ├── sass/components/_prefix.scss
# // ├── sass/components/_heading-hero.scss
# // └── svg/block-icons/hero-big-image.svg

# // Changes to files/folders:
# // ├── js/src/front-end.js
# // ├── sass/components/_components.scss
# // ├── sass/gutenberg/_blocks.scss
# // ├── acf-json/
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_618bb10852874.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"

# JavaScript dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/js/src/modules/100vh.js ${PROJECT_THEME_PATH}/js/src/modules/100vh.js

# Import js modules right after the last default js module in the front-end.js file
sed -e "/\import \'what-input\'\;/a\\
import './modules/100vh';" < ${PROJECT_THEME_PATH}/js/src/front-end.js > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Style component dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_prefix.scss ${PROJECT_THEME_PATH}/sass/components/
# Heading hero is in the theme but let's just leave it here as a "dependency" for now just in case
#cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_heading-hero.scss ${PROJECT_THEME_PATH}/sass/components/

# Import components right after the last default component in the _components.scss file
sed -e "/\@import \'link\'\;/a\\
@import 'prefix';" < ${PROJECT_THEME_PATH}/sass/components/_components.scss > ${PROJECT_THEME_PATH}/sass/components/_components_with_changes.scss
rm ${PROJECT_THEME_PATH}/sass/components/_components.scss
mv ${PROJECT_THEME_PATH}/sass/components/_components_with_changes.scss ${PROJECT_THEME_PATH}/sass/components/_components.scss

# Other SVG icons needed by this block
# cp -nv ${AIRBLOCKS_THEME_PATH}/svg/play.svg ${PROJECT_THEME_PATH}/svg/

# Register ACF block in functions.php
# Please note: The title of the block will be translated in localization.sh if en is selected
sed -e "/\'acf_blocks\' \=\> \[/a\\
      [|\
       'name' => 'hero-full-height',|\
       'title' => 'Sivun korkea yläosa',|\
      ],\\" < ${PROJECT_THEME_PATH}/functions.php | tr '|' '\n' > ${PROJECT_THEME_PATH}/tmpfile
