#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:07:42
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-08 10:35:30

# Localization variables
LOCALIZED_STRINGS="${SCRIPTS_LOCATION}/tasks/localization.properties"

# Loop through strings and update file
while IFS="=" read -r TRANSLATE_FROM TRANSLATE_TO;
do
  sed -i'' -e "s/$TRANSLATE_FROM/$TRANSLATE_TO/" ${BLOCK_ACF_JSON_PATH}
done < "${LOCALIZED_STRINGS}" > ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json;

# Import the localized file with ACF fields
cp -nv ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json ${PROJECT_THEME_PATH}/acf-json/
mv ${PROJECT_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json ${PROJECT_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}

# Remove the leftover file
rm ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json
