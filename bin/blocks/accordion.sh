#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-10 10:44:02
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-10 11:14:21

# // New files/Dependencies (this file will install them):
# // ├── js/src/modules/accordion.js
# // ├── sass/gutenberg/blocks/_accordion.scss
# // ├── svg/minus.svg
# // ├── svg/plus.svg
# // └── svg/block-icons/accordion.svg

# // Changes to files/folders:
# // ├── js/src/front-end.js
# // ├── sass/gutenberg/_blocks.scss
# // ├── acf-json/
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_61d8052f4ea71.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"

# JavaScript dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/js/src/modules/accordion.js ${PROJECT_THEME_PATH}/js/src/modules/accordion.js

# Import js modules right after the last default js module in the front-end.js file
sed -e "/\import \'what-input\'\;/a\\
import './modules/accordion';" < ${PROJECT_THEME_PATH}/js/src/front-end.js > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Style component dependencies
#cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_prefix.scss ${PROJECT_THEME_PATH}/sass/components/_prefix.scss

# Import components right after the last default component in the _components.scss file
#sed -e "/\@import \'link\'\;/a\\
#@import 'prefix';" < ${PROJECT_THEME_PATH}/sass/components/_components.scss > ${PROJECT_THEME_PATH}/sass/components/_components_with_changes.scss
#rm ${PROJECT_THEME_PATH}/sass/components/_components.scss
#mv ${PROJECT_THEME_PATH}/sass/components/_components_with_changes.scss ${PROJECT_THEME_PATH}/sass/components/_components.scss

# Other SVG icons needed by this block
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/minus.svg ${PROJECT_THEME_PATH}/svg/
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/plus.svg ${PROJECT_THEME_PATH}/svg/

# Register ACF block in functions.php
# Please note: The title of the block will be translated in localization.sh if en is selected
sed -e "/\'acf_blocks\' \=\> \[/a\\
      [|\
       'name' => 'accordion',|\
       'title' => 'Haitari',|\
      ],\\" < ${PROJECT_THEME_PATH}/functions.php | tr '|' '\n' > ${PROJECT_THEME_PATH}/tmpfile
