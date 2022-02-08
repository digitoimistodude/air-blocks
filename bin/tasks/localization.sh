#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:07:42
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-08 10:50:02

# Translate strings
sed -i'' \
-e 's/\"title\"\: \"Lohko\: Sivun yläosa\"\,/\"title\"\: \"Block\: Hero\"\,/' \
-e 's/\"label\"\: \"Taustakuva\"\,/\"title\"\: \"Background image\"\,/' \
-e 's/\"label\"\: \"Taustavideo \(\.mp4\, max 2mb\)\"\,/\"label\"\: \"Background video \(\.mp4\, max 2mb\)\"\,/' \
-e 's/\"label\"\: \"Yläotsikko\"\,/\"label\"\: \"Upper title\"\,/' \
-e 's/\"instructions\"\: \"Jos kenttä on jätetty tyhjäksi\, tilalla näytetään murupolku\.\"\,/\"instructions\"\: \"If field is left out empty\, will show breadcrumbs in place\.\"\,/' \
-e 's/\"label\"\: \"Otsikko\"\,/\"label\"\: \"Heading\"\,/' \
-e 's/\"label\"\: \"Tekstisisältö\"\,/\"label\"\: \"Text content\"\,/' \
-e 's/\"label\"\: \"Nappi\"\,/\"label\"\: \"Button\"\,/' \
-e 's/\"label\"\: \"Tyyli\"\,/\"label\"\: \"Style\"\,/' ${BLOCK_ACF_JSON_PATH} > ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json;

# Import the localized file with ACF fields
cp -nv ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json ${PROJECT_THEME_PATH}/acf-json/
mv ${PROJECT_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json ${PROJECT_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}

# Remove the leftover file
rm ${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}_en.json
