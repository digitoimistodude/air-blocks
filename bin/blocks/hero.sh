#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:23:24
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-07 16:37:26

# Block specific variables
export BLOCK_ACF_JSON_FILE="${AIRBLOCKS_THEME_PATH}/acf-json/group_618bb10852874.json"

# JavaScript dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/js/src/modules/100vh.js ${PROJECT_THEME_PATH}/js/src/modules/100vh.js

# Style component dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_prefix.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_heading-hero.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/

# Other SVG icons needed by this block
# cp -nv ${AIRBLOCKS_THEME_PATH}/svg/play.svg ${PROJECT_THEME_PATH}/svg/

# Register ACF block in functions.php
sed -e "/\'acf_blocks\' \=\> \[/a\\
      [|\
       'name' => 'hero',|\
       'title' => 'Sivun yläosa',|\
      ],\\" < functions.php | tr '|' '\n' < ${AIRBLOCKS_THEME_PATH}/functions.php > ${AIRBLOCKS_THEME_PATH}/functions_with_changes.php

# Remove the file without any changes
rm ${AIRBLOCKS_THEME_PATH}/functions.php

# Rename the changed file to the official one
mv ${AIRBLOCKS_THEME_PATH}/functions_with_changes.php ${AIRBLOCKS_THEME_PATH}/functions.php

# Check if translations are needed
if [[ ${AIR_BLOCKS_LANG} = "en" ]]; then
  # Run localization task
  source ${SCRIPTS_LOCATION}/tasks/localization.sh
else
  # Just import the ACF fields file "as is"
  cp -nv ${BLOCK_ACF_JSON_FILE} ${PROJECT_THEME_PATH}/acf-json/
fi
