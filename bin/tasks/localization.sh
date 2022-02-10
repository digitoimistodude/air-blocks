#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:07:42
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-10 10:54:21

# Translate strings for block json (defined in the sh file of the selected block)

# Block: hero-full-height and some general translations
sed -i'' -e 's/\"title\"\: \"Lohko\: Sivun korkea yläosa\"\,/\"title\"\: \"Block\: Hero with full height\"\,/
s/\"label\"\: \"Taustakuva\"\,/\"label\"\: \"Background image\"\,/
s/\"label\"\: \"Taustavideo/\"label\"\: \"Background video/
s/\"label\"\: \"Yläotsikko\"\,/\"label\"\: \"Upper title\"\,/
s/\"instructions\"\: \"Jos kenttä on jätetty tyhjäksi\, tilalla näytetään murupolku\.\"\,/\"instructions\"\: \"If field is left out empty\, will show breadcrumbs in place\.\"\,/
s/\"label\"\: \"Otsikko\"\,/\"label\"\: \"Heading\"\,/
s/\"label\"\: \"Tekstisisältö\"\,/\"label\"\: \"Content\"\,/
s/\"label\"\: \"Nappi\"\,/\"label\"\: \"Button\"\,/
s/\"label\"\: \"Tyyli\"\,/\"label\"\: \"Style\"\,/' ${BLOCK_ACF_JSON_PATH}

# Translate blocks for functions.php, make changes directly to the file
sed -e 's/Sivun korkea yläosa/Hero with full height/' ${PROJECT_THEME_PATH}/functions.php > ${PROJECT_THEME_PATH}/tmpfile

# Block: accordion
sed -i'' -e 's/\"title\"\: \"Lohko\: Haitari\"\,/\"title\"\: \"Block\: Accordion\"\,/
s/\"label\"\: \"Haitarin kohteet\"\,/\"label\"\: \"Accordion items\"\,/' ${BLOCK_ACF_JSON_PATH}

# Translate blocks for functions.php, make changes directly to the file
sed -e 's/Haitari/Accordion/' ${PROJECT_THEME_PATH}/functions.php > ${PROJECT_THEME_PATH}/tmpfile
