#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:23:24
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-01-11 19:23:55

# JavaScript dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/js/src/modules/100vh.js ${PROJECT_THEME_PATH}/js/src/modules/100vh.js

# Style component dependencies
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_prefix.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/components/_heading-hero.scss ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/

# Other SVG icons needed by this block
# cp -nv ${AIRBLOCKS_THEME_PATH}/svg/play.svg ${PROJECT_THEME_PATH}/svg/

# Import ACF fields
cp -nv ${AIRBLOCKS_THEME_PATH}/acf-json/group_618bb10852874.json ${PROJECT_THEME_PATH}/acf-json/

# Register ACF block in functions.php
sed -e "/\'acf_blocks\' \=\> \[/a\\
  \[
    \'name\' \=\> \'\hero\'\,
    \'title\' \=\> \'Sivun yläosa\'\,
  \]\," < ${AIRBLOCKS_THEME_PATH}/functions.php > ${AIRBLOCKS_THEME_PATH}/functions2.php
rm ${AIRBLOCKS_THEME_PATH}/functions.php
mv ${AIRBLOCKS_THEME_PATH}/functions2.php ${AIRBLOCKS_THEME_PATH}/functions.php
