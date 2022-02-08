#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:07:42
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-08 10:47:29

# Translate strings
sed -i'' \
-e 's/\"title\"\: \"Lohko\: Sivun yläosa\"\,/\"title\"\: \"Block\: Hero\"\,/' ${BLOCK_ACF_JSON_PATH} \
-e 's/\"label\"\: \"Taustakuva\"\,/\"title\"\: \"Background image\"\,/' ${BLOCK_ACF_JSON_PATH} \
-e 's/\"label\"\: \"Taustavideo \(\.mp4\, max 2mb\)\"\,/\"label\"\: \"Background video \(\.mp4\, max 2mb\)\"\,/' ${BLOCK_ACF_JSON_PATH} \
-e 's/\"label\"\: \"Yläotsikko\"\,/\"label\"\: \"Upper title\"\,/' ${BLOCK_ACF_JSON_PATH} \
-e 's/\"instructions\"\: \"Jos kenttä on jätetty tyhjäksi\, tilalla näytetään murupolku\.\"\,/\"instructions\"\: \"If field is left out empty\, will show breadcrumbs in place\.\"\,/' ${BLOCK_ACF_JSON_PATH} \
-e 's/\"label\"\: \"Otsikko\"\,/\"label\"\: \"Heading\"\,/' ${BLOCK_ACF_JSON_PATH} \
-e 's/\"label\"\: \"Tekstisisältö\"\,/\"label\"\: \"Text content\"\,/' ${BLOCK_ACF_JSON_PATH} \
-e 's/\"label\"\: \"Nappi\"\,/\"label\"\: \"Button\"\,/' ${BLOCK_ACF_JSON_PATH} \
-e 's/\"label\"\: \"Tyyli\"\,/\"label\"\: \"Style\"\,/' ${BLOCK_ACF_JSON_PATH} > ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json;

# Import the localized file with ACF fields
cp -nv ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json ${PROJECT_THEME_PATH}/acf-json/
mv ${PROJECT_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json ${PROJECT_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}

# Remove the leftover file
rm ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json
