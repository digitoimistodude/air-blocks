#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-10 10:44:02
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-08-23 15:04:44

# // New files/Dependencies (this file will install them):
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
export BLOCK_UI_TITLE="Kuvakaruselli"

# Install npm dependencies
cd ${PROJECT_THEME_PATH}
npm install swiper --save

# JavaScript dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/js/src/modules/carousel.js ${PROJECT_THEME_PATH}/js/src/modules/carousel.js

# Import js modules
sed -e "/\/\/ Import modules/a\\
import initCarousel from './modules/carousel';" < ${PROJECT_THEME_PATH}/js/src/front-end.js > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Init carousel code inside DOMContentLoaded
sed -e "/\DOMContentLoaded/a\\
initCarousel();" < ${PROJECT_THEME_PATH}/js/src/front-end.js > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Add carousel settings code to gutenberg-editor.js
sed -e "/modules\/gutenberg-helpers\'\;/a\\
import initCarousel from \'\.\/modules\/carousel\'\;\\" < ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js | tr '§' '\n' > ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js
rm ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js
mv ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js

# Init carousel inside initializeBlock function
sed -e "/airblocks_LazyLoad.update();/a\\
    initCarousel\(\)\;" < ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js | tr '§' '\n' > ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js
rm ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js
mv ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js

# Re-run to add another position
sed -e "/airblocks_LazyLoad.update();/a\\
  initCarousel\(\)\;" < ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js | tr '§' '\n' > ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js
rm ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js
mv ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js

# Other SVG icons needed by this block
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/slider-left-arrow.svg ${PROJECT_THEME_PATH}/svg/
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/slider-right-arrow.svg ${PROJECT_THEME_PATH}/svg/

