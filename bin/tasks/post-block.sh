#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-08 16:03:52
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-03-09 12:06:34
# Tasks after functions.php has been updated

# Let's go to the project directory
cd ${PROJECTS_HOME}/${PROJECT_NAME}

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

# Run gulp for SCSS and JS once
echo "${BOLDYELLOW}Running gulp tasks (requires npm packages to be installed previously)...${TXTRESET} "
cd ${PROJECTS_HOME}/${PROJECT_NAME}
gulp js
gulp devstyles
gulp prodstyles

# Activate block ACF fields
echo "${BOLDYELLOW}Activating ACF fields for the block...${TXTRESET} "
vendor/wp-cli/wp-cli/bin/wp eval "acf_import_field_group( json_decode( file_get_contents( '$BLOCK_ACF_JSON_PATH' ), true ) );"
