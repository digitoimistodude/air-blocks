#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:07:42
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-07 16:36:32

# Localization variables
LOCALIZED_STRINGS="${SCRIPTS_LOCATION}/tasks/localization.properties"

# Loop through strings and update file
while IFS="=" read -r TRANSLATE_FROM TRANSLATE_TO;
  do
    echo "Translating ${TRANSLATE_FROM} to ${TRANSLATE_TO}"
    sed -i'' -e 's/$TRANSLATE_FROM/$TRANSLATE_TO/' ${BLOCK_ACF_JSON_FILE}
  fi
done < "${BLOCK_ACF_JSON_FILE}" > ${BLOCK_ACF_JSON_FILE}_en.json;

# Import the localized file with ACF fields
cp -nv ${BLOCK_ACF_JSON_FILE}_en.json ${PROJECT_THEME_PATH}/acf-json/

# Remove the leftover file
rm ${BLOCK_ACF_JSON_FILE}_en.json
