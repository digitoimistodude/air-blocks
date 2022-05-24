#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-10 10:44:02
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-05-24 12:13:43

# // New files/Dependencies (this file will install them)::
# // ├── sass/gutenberg/blocks/_carousel.scss (automatic from get-block.sh)
# // ├── node_modules/swiper (from npm)
# // ├── svg/slider-left-arrow.svg
# // ├── svg/slider-right-arrow.svg
# // └── svg/block-icons/carousel.svg (automatic from get-block.sh)

# // Changes to files/folders:
# // ├── js/src/front-end.js
# // ├── sass/gutenberg/_blocks.scss
# // ├── sass/global.scss
# // ├── acf-json/
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_61b9a58583b15.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"

# Install npm dependencies
cd ${PROJECT_THEME_PATH}
npm install swiper --save

# Import js modules right after the last default js module in the front-end.js file
sed -e "/\import\ backToTop\ from \'\.\/modules\/top\'\;/a\\
import initCarousels from './modules/carousels';" < ${PROJECT_THEME_PATH}/js/src/front-end.js > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Init carousel code inside DOMContentLoaded
sed -e "/\initAnchors\(\)\;/a\\
initCarousels();" < ${PROJECT_THEME_PATH}/js/src/front-end.js > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Other SVG icons needed by this block
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/slider-left-arrow.svg ${PROJECT_THEME_PATH}/svg/
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/slider-right-arrow.svg ${PROJECT_THEME_PATH}/svg/

# Register ACF block in functions.php
# Please note: The title of the block will be translated in localization.sh if en is selected
sed -e "/\'acf_blocks\' \=\> \[/a\\
      [§\
       'name' => 'carousel',§\
       'title' => 'Kuvakaruselli',§\
      ],\\" < ${PROJECT_THEME_PATH}/functions.php | tr '§' '\n' > ${PROJECT_THEME_PATH}/tmpfile
