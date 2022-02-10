#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-10 10:44:02
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-10 15:21:20


# // New files/Dependencies (this file will install them)::
# // ├── sass/gutenberg/blocks/_carousel.scss (automatic from get-block.sh)
# // ├── node_modules/slick-carousel (automatic from theme npm)
# // ├── sass/features/_slick.scss
# // ├── js/src/gutenberg-editor.js
# // ├── svg/slider-left-arrow.svg
# // ├── svg/slider-right-arrow.svg
# // └── svg/block-icons/carousel.svg (automatic from get-block.sh)

# // Changes to files/folders:
# // ├── js/src/front-end.js
# // ├── sass/gutenberg/_blocks.scss
# // ├── sass/global.scss
# // ├── acf-json/
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_61b9a58583b15.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"

# SCSS features
cp -nv ${AIRBLOCKS_THEME_PATH}/sass/features/_slick.scss ${PROJECT_THEME_PATH}/sass/features/

# Import feature styles to global.scss
sed -e "/\/\/ Global features/a\\
@import 'features/slick';" < ${PROJECT_THEME_PATH}/sass/global.scss > ${PROJECT_THEME_PATH}/sass/global_with_changes.scss
rm ${PROJECT_THEME_PATH}/sass/global.scss
mv ${PROJECT_THEME_PATH}/sass/global_with_changes.scss ${PROJECT_THEME_PATH}/sass/global.scss

# JS direct replaces
LC_ALL=C sed -i '' -e "s;\/\/ import slick from \'slick-carousel\'\;;import slick from \'slick-carousel\'\;;" ${PROJECT_THEME_PATH}/js/src/front-end.js

# Add carousel code to front-end.js
sed -e "/\/\/ Document ready start/a\\
  \$\(\(\) \=\> \{|\
    \/\/ Slick|\
    const slickSettings \= {|\
      infinite\: true\,|\
      slidesToShow\: 2\,|\
      slidesToScroll\: \1,|\
      arrows\: true\,|\
      dots\: false\,|\
      speed\: 660\,|\
      variableWidth\: true\,|\
      prevArrow\: \'\<button class=\"slick-btn slick-prev\">\<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"32\" \height=\"32\" fill=\"currentColor\" viewBox\=\"0 0 1000 1000\"\>\<path d\=\"M733 990L243 500 733 10l23.9 23.9-466 466.1L757 966.1 733 990z\"\/\>\<\/svg\>\<\/button\>\'\,|\
      nextArrow\: \'\<button class=\"slick-btn slick-next\">\<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"32\" \height=\"32\" fill=\"currentColor\" viewBox\=\"0 0 1000 1000\"\>\<path d\=\"M240.9 964.1l25.9 25.9 492.3-492.3-.4-.4L271.6 10 246 35.6l461.7 461.7-466.8 466.8z\"\/\>\<\/svg\>\<\/button\>\'\,|\
    \}\;|\
|\
    const imageCarousels \= document\.querySelectorAll\(\'\.slider\'\)\;|\
|\
    imageCarousels\.forEach\(\(slider\) \=\> \{|\
      \$\(slider\)\.slick\({|\
        \.\.\.slickSettings\,|\
        appendArrows\: slider\.parentNode\.querySelector\(\'\.controls\-buttons\'\)\,|\
      \}\)\;|\
    \}\)\;|\
  \}\)\;|\\" < ${PROJECT_THEME_PATH}/js/src/front-end.js | tr '|' '\n' > ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/front-end.js
mv ${PROJECT_THEME_PATH}/js/src/front-end-with-changes.js ${PROJECT_THEME_PATH}/js/src/front-end.js

# Add carousel settings code to gutenberg-editor.js
sed -e "/modules\/gutenberg-helpers\'\;/a\\
|\
\/\/ Slick|\
const slickSettings \= \{|\
  infinite\: true\,|\
  slidesToShow\: 2\,|\
  slidesToScroll\: 1\,|\
  arrows\: true\,|\
  dots\: false\,|\
  speed\: 660\,|\
  variableWidth\: true\,|\
  prevArrow\: \'\<button class=\"slick-btn slick-prev\">\<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"32\" \height=\"32\" fill=\"currentColor\" viewBox\=\"0 0 1000 1000\"\>\<path d\=\"M733 990L243 500 733 10l23.9 23.9-466 466.1L757 966.1 733 990z\"\/\>\<\/svg\>\<\/button\>\'\,|\
  nextArrow\: \'\<button class=\"slick-btn slick-next\">\<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"32\" \height=\"32\" fill=\"currentColor\" viewBox\=\"0 0 1000 1000\"\>\<path d\=\"M240.9 964.1l25.9 25.9 492.3-492.3-.4-.4L271.6 10 246 35.6l461.7 461.7-466.8 466.8z\"\/\>\<\/svg\>\<\/button\>\'\,|\
\}\;\\" < ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js | tr '|' '\n' > ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js
rm ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js
mv ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js

# Add carousel inside editor window load
sed -e "/window\.addEventListener/a\\
|\
  \/\/ Slick carousels|\
  \/\/ Must be in jQuery syntax and have a timeout to work properly|\
  setTimeout\(function \(\) \{|\
    if \(jQuery\(\'\.slider\') \!\=\= undefined\) \{|\
      jQuery\(\'\.slider\'\)\.each\(function \(\) \{|\
        jQuery\(this\)\.slick\(\{|\
          \.\.\.slickSettings\,|\
          appendArrows\: jQuery\(this\)\.siblings\(\'\.controls\-buttons\'\)\,|\
        \}\)\;|\
      \}\)\;|\
    \}|\
  \}\, 2000\)\;|\\" < ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js | tr '|' '\n' > ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js
rm ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js
mv ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js

# Add carousel inside initializeBlock on Gutenberg editor
sed -e "/var initializeBlock/a\\
|\
  \/\/ Slick carousels|\
  \/\/ Must be in jQuery syntax and have a timeout to work properly|\
  setTimeout\(function \(\) \{|\
    if \(jQuery\(\'\.slider\') \!\=\= undefined\) \{|\
      jQuery\(\'\.slider\'\)\.each\(function \(\) \{|\
        jQuery\(this\)\.slick\(\{|\
          \.\.\.slickSettings\,|\
          appendArrows\: jQuery\(this\)\.siblings\(\'\.controls\-buttons\'\)\,|\
        \}\)\;|\
      \}\)\;|\
    \}|\
  \}\, 2000\)\;|\\" < ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js | tr '|' '\n' > ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js
rm ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js
mv ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-changes.js ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js

# Import js modules right after the last default js module in the gutenberg-editor.js file
sed -e "/\import\/no-unresolved \*\//a\\
import slick from 'slick-carousel';" < ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js > ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-with-changes.js
rm ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js
mv ${PROJECT_THEME_PATH}/js/src/gutenberg-editor-with-changes.js ${PROJECT_THEME_PATH}/js/src/gutenberg-editor.js

# Other SVG icons needed by this block
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/slider-left-arrow ${PROJECT_THEME_PATH}/svg/
cp -nv ${AIRBLOCKS_THEME_PATH}/svg/slider-right-arrow.svg ${PROJECT_THEME_PATH}/svg/

# Register ACF block in functions.php
# Please note: The title of the block will be translated in localization.sh if en is selected
sed -e "/\'acf_blocks\' \=\> \[/a\\
      [|\
       'name' => 'carousel',|\
       'title' => 'Kuvakaruselli',|\
      ],\\" < ${PROJECT_THEME_PATH}/functions.php | tr '|' '\n' > ${PROJECT_THEME_PATH}/tmpfile
