#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-10 10:44:02
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-08-18 15:07:05

# // New files/Dependencies (this file will install them):
# // ├── sass/gutenberg/blocks/_accordion.scss (automatic from get-block.sh)
# // ├── js/src/modules/accordion.js
# // ├── svg/minus.svg
# // ├── svg/plus.svg
# // └── svg/block-icons/accordion.svg

# // Changes to files/folders:
# // ├── js/src/front-end.js
# // ├── sass/gutenberg/_blocks.scss
# // ├── sass/gutenberg-editor-styles.scss
# // ├── acf-json/
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_61d8052f4ea71.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"
export BLOCK_UI_TITLE="Haitari"

# JavaScript dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/js/src/modules/accordion.js ${PROJECT_THEME_PATH}/js/src/modules/accordion.js

# Import js modules right after the last default js module in the front-end.js file
sed -e "/\/\/ Import modules/a\\
import initAccordions from './modules/accordion';" < ${PROJECT_THEME_PATH}/js/src/front-end.js > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Init accordion code inside DOMContentLoaded
sed -e "/\DOMContentLoaded/a\\
  initAccordions();" < ${PROJECT_THEME_PATH}/js/src/front-end.js > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Import styles to gutenberg-editor-styles.scss right after gravity forms import
sed -e "/\@import \'features\/gravity-forms\'\;/a\\
§\
  \/\/ Import accordion inside Gutenberg editor just to make sure§\
  \@import \'gutenberg\/blocks\/accordion\'\;\\" < ${PROJECT_THEME_PATH}/sass/gutenberg-editor-styles.scss | tr '§' '\n' > ${PROJECT_THEME_PATH}/sass/gutenberg-editor-styles-with-changes.scss
rm ${PROJECT_THEME_PATH}/sass/gutenberg-editor-styles.scss
mv ${PROJECT_THEME_PATH}/sass/gutenberg-editor-styles-with-changes.scss ${PROJECT_THEME_PATH}/sass/gutenberg-editor-styles.scss

# Other SVG icons needed by this block
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/minus.svg ${PROJECT_THEME_PATH}/svg/
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/plus.svg ${PROJECT_THEME_PATH}/svg/
