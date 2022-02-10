#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-08 16:03:52
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-10 10:55:41
# Tasks after functions.php has been updated

# Remove the file without any changes
rm ${PROJECT_THEME_PATH}/functions.php

# Rename the changed file to the official one
mv ${PROJECT_THEME_PATH}/tmpfile ${PROJECT_THEME_PATH}/functions.php

# Run required things after the block/<block>.sh
# (like localization.sh that needs to be run after the <block>.sh
# because it gets variables from that file)

# Localizations
echo "${BOLDYELLOW}Importing ACF fields (json)...${TXTRESET} "

# Check if translations are needed
if [[ ${AIR_BLOCKS_LANG} = "en" ]]; then
  # Run localization task
  source ${SCRIPTS_LOCATION}/tasks/localization.sh
fi

# Just import the ACF fields file
cp -nv ${BLOCK_ACF_JSON_PATH} ${PROJECT_THEME_PATH}/acf-json/

# Tasks after functions.php has been updated, again (in localization.sh)
# Remove the file without any changes
rm ${PROJECT_THEME_PATH}/functions.php

# Rename the changed file to the official one
mv ${PROJECT_THEME_PATH}/tmpfile ${PROJECT_THEME_PATH}/functions.php

# Run gulp for SCSS and JS once
echo "${BOLDYELLOW}Running gulp tasks (requires npm packages to be installed previously)...${TXTRESET} "
cd ${PROJECTS_HOME}/${PROJECT_NAME}
gulp js
gulp devstyles
gulp prodstyles
