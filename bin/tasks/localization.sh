#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:07:42
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-03-09 12:06:10

# Block: hero-full-height and some general translations
sed -i '' -e 's/\"title\"\: \"Lohko\: Sivun korkea yläosa\"\,/\"title\"\: \"Block\: Hero with full height\"\,/
s/\"label\"\: \"Taustakuva\"\,/\"label\"\: \"Background image\"\,/
s/\"label\"\: \"Taustavideo/\"label\"\: \"Background video/
s/\"label\"\: \"Yläotsikko\"\,/\"label\"\: \"Upper title\"\,/
s/\"instructions\"\: \"Jos kenttä on jätetty tyhjäksi\, tilalla näytetään murupolku\.\"\,/\"instructions\"\: \"If field is left out empty\, will show breadcrumbs in place\.\"\,/
s/\"label\"\: \"Otsikko\"\,/\"label\"\: \"Heading\"\,/
s/\"label\"\: \"Tekstisisältö\"\,/\"label\"\: \"Content\"\,/
s/\"label\"\: \"Nappi\"\,/\"label\"\: \"Button\"\,/
s/\"label\"\: \"Tyyli\"\,/\"label\"\: \"Style\"\,/' ${BLOCK_ACF_JSON_PATH}

# Block: accordion
sed -i '' -e 's/\"title\"\: \"Lohko\: Haitari\"\,/\"title\"\: \"Block\: Accordion\"\,/
s/\"button_label\"\: \"Lisää uusi haitari/\"button_label\"\: \"Add new accordion/
s/\"label\"\: \"Haitarin kohteet\"\,/\"label\"\: \"Accordion items\"\,/' ${BLOCK_ACF_JSON_PATH}

# Block: carousel
sed -i '' -e 's/\"title\"\: \"Lohko\: Kuvakaruselli\"\,/\"title\"\: \"Block\: Carousel\"\,/
s/\"label\"\: \"Kuvat/\"label\"\: \"Images/' ${BLOCK_ACF_JSON_PATH}

# General ACF fields
sed -i '' -e 's/Lohko\:/Block\:/' ${BLOCK_ACF_JSON_PATH}

# Block: content-columns-50-50
sed -i '' -e 's/\"title\"\: \"Lohko\: Kaksi tekstisisältöpalstaa\"\,/\"title\"\: \"Block\: Two text content columns\"\,/
s/\"label\"\: \"Oikeanpuoleinen otsikko/\"label\"\: \"Title on the right side/
s/\"label\"\: \"Vasemmanpuoleinen tekstisisältö/\"label\"\: \"Content on the left side/
s/\"label\"\: \"Oikeanpuoleinen tekstisisältö/\"label\"\: \"Content on the right side/
s/\"label\"\: \"Vasemmanpuoleinen otsikko/\"label\"\: \"Title on the left side/' ${BLOCK_ACF_JSON_PATH}

# Blocks for functions.php, make changes directly to the file
sed -i '' -e 's/Kuvakaruselli/Carousel/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Lomake/Form/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Tekstisisältö/Content/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Haitari/Accordion/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Kuva ja tekstisisältö vierekkäin/Image and content side by side/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Tekstipalstat kuvilla/Content columns with images/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Tekstipalstat ikoneilla/Content columns with icons/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Lainaus/Quote/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Kaksi tekstisisältöpalstaa/Two text columns/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Otsikko ja tekstisisältö palstoissa/Title and content columns/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Sivun yläosa pienellä kuvalla/Hero with small image/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Sivun yläosa isolla kuvalla/Hero with big image/' ${PROJECT_THEME_PATH}/functions.php
sed -i '' -e 's/Sivun korkea yläosa/Hero with full height/' ${PROJECT_THEME_PATH}/functions.php

# Block: form
sed -i '' -e 's/\: Lomake/\: Form/
s/\"label\"\: \"Tekstin valinta/\"label\"\: \"Text choices/
s/\"default\"\: \"Käytä lomakkeen otsikkoa ja tekstikenttää/\"default\"\: \"Use form title and text content from Gravity Forms/
s/\"manual\"\: \"Aseta otsikko ja teksti käsin/\"label\"\: \"Set title and text content manually/
s/\"label\"\: \"Valitse lomake/\"label\"\: \"Select form/' ${BLOCK_ACF_JSON_PATH}
