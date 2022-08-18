#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-08-18 13:02:37
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-08-18 15:14:46

# // New files/Dependencies (this file will install them):
# // ├── sass/gutenberg/blocks/_hero-big-image.scss (automatic from get-block.sh)
# // ├── sass/components/_content-box.scss
# // └── svg/block-icons/hero-big-image.svg

# // Changes to files/folders:
# // ├── sass/components/_components.scss
# // ├── sass/gutenberg/_blocks.scss
# // ├── acf-json/
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_62022454b648d.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"
export BLOCK_UI_TITLE="Sivun yläosa isolla taustakuvalla"

# Style component dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_content-box.scss ${PROJECT_THEME_PATH}/sass/components/

# Import components right after the last default component in the _components.scss file
sed -e "/\@import \'link\'\;/a\\
@import 'content-box';" < ${PROJECT_THEME_PATH}/sass/components/_components.scss > ${PROJECT_THEME_PATH}/sass/components/_components_with_changes.scss
rm ${PROJECT_THEME_PATH}/sass/components/_components.scss
mv ${PROJECT_THEME_PATH}/sass/components/_components_with_changes.scss ${PROJECT_THEME_PATH}/sass/components/_components.scss
