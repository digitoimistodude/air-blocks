#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:07:42
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-08 15:51:37

# Translate strings for block json (defined in the sh file of the selected block)
sed -i'' -e 's/\"title\"\: \"Lohko\: Sivun yläosa\"\,/\"title\"\: \"Block\: Hero\"\,/
s/\"label\"\: \"Taustakuva\"\,/\"title\"\: \"Background image\"\,/
s/\"label\"\: \"Taustavideo/\"label\"\: \"Background video/
s/\"label\"\: \"Yläotsikko\"\,/\"label\"\: \"Upper title\"\,/
s/\"instructions\"\: \"Jos kenttä on jätetty tyhjäksi\, tilalla näytetään murupolku\.\"\,/\"instructions\"\: \"If field is left out empty\, will show breadcrumbs in place\.\"\,/
s/\"label\"\: \"Otsikko\"\,/\"label\"\: \"Heading\"\,/
s/\"label\"\: \"Tekstisisältö\"\,/\"label\"\: \"Text content\"\,/
s/\"label\"\: \"Nappi\"\,/\"label\"\: \"Button\"\,/
s/\"label\"\: \"Tyyli\"\,/\"label\"\: \"Style\"\,/' ${BLOCK_ACF_JSON_PATH}

# Translate blocks for functions.php, make changes directly to the file
sed -e 's/Sivun yläosa/Hero/' ${PROJECT_THEME_PATH}/functions.php > ${PROJECT_THEME_PATH}/tmpfile
