#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:23:24
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-15 11:13:45

# Install md5 if not installed
brew install md5sha1sum

# Block specific variables
export RANDOMHASH=`echo $RANDOM | md5sum | head -c 13; echo;`
export RANDOMHASH_FIELD=`echo $RANDOM | md5sum | head -c 13; echo;`
export BLOCK_ACF_JSON_FILE="group_${RANDOMHASH}.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"

# All the typical tasks that we do in every single block
# Checking if block already exists
if [ -f "${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG}.php" ]; then
echo "
${RED}Block already exists. The newtheme script will now quit...${TXTRESET}
  "
    exit
  else
    echo "${YELLOW}Creating ${BLOCK_SLUG} block assets...${TXTRESET}"

    # Create ACF fields
    echo "{
    \"key\": \"group_${RANDOMHASH}\",
    \"title\": \"Lohko: ${BLOCK_UI_TITLE}\",
    \"fields\": [
        {
            \"key\": \"field_${RANDOMHASH_FIELD}\",
            \"label\": \"Otsikko\",
            \"name\": \"title\",
            \"type\": \"text\",
            \"instructions\": \"\",
            \"required\": 0,
            \"conditional_logic\": 0,
            \"wrapper\": {
                \"width\": \"\",
                \"class\": \"\",
                \"id\": \"\"
            },
            \"default_value\": \"\",
            \"placeholder\": \"\",
            \"prepend\": \"\",
            \"append\": \"\",
            \"maxlength\": \"\"
        }
    ],
    \"location\": [
        [
            {
                \"param\": \"block\",
                \"operator\": \"==\",
                \"value\": \"acf\/${BLOCK_SLUG}\"
            }
        ]
    ],
    \"menu_order\": 0,
    \"position\": \"normal\",
    \"style\": \"default\",
    \"label_placement\": \"top\",
    \"instruction_placement\": \"label\",
    \"hide_on_screen\": \"\",
    \"active\": true,
    \"description\": \"\",
    \"show_in_rest\": 0,
    \"modified\": 1644574693
}" > ${BLOCK_ACF_JSON_PATH}

  # The block file
  echo "<?php
/**
 * The template for ${BLOCK_SLUG}
 *
 * Description of your block called \"${BLOCK_SLUG}\" goes here.
 *
 * @Author:		Roni Laukkarinen
 * @Date:   		2022-02-10 12:28:36
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-02-10 12:28:36
 *
 * @package ${PROJECT_NAME}
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

// Fields
\$title = get_field( 'title' );

if ( empty( \$title ) ) {
  maybe_show_error_block( 'A title is required' );
  return;
}
?>

<section class=\"block block-${BLOCK_SLUG}\">
  <div class=\"container\">

    <h2>
      <?php echo esc_html( \$title ); ?>
    </h2>

    <!-- Start coding here -->
  </div>
</section>" > ${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG}.php

  # Styles for block
  echo ".block-${BLOCK_SLUG} {
  // Your block styles here
}" > ${PROJECT_THEME_PATH}/assets/src/sass/gutenberg/blocks/_${BLOCK_SLUG}.scss

  # Import block styles to _blocks.scss
  sed -e "/\/\/ ACF blocks/a\\
  @import 'gutenberg/blocks/${BLOCK_SLUG}';" < ${PROJECT_THEME_PATH}/assets/src/sass/gutenberg/_blocks.scss > ${PROJECT_THEME_PATH}/assets/src/sass/gutenberg/_blocks_with_changes.scss
  rm ${PROJECT_THEME_PATH}/assets/src/sass/gutenberg/_blocks.scss
  mv ${PROJECT_THEME_PATH}/assets/src/sass/gutenberg/_blocks_with_changes.scss ${PROJECT_THEME_PATH}/assets/src/sass/gutenberg/_blocks.scss

  # Block icon
  mkdir -p ${PROJECT_THEME_PATH}/svg/block-icons

  # There is no block icon so we can't copy it, but let's keep this as a placeholder if we get some default in the future
  #cp -nv ${AIRBLOCKS_THEME_PATH}/svg/block-icons/${BLOCK_SLUG}.svg ${PROJECT_THEME_PATH}/svg/block-icons/
fi

# Register ACF block in functions.php
# Please note: The title of the block will be translated in localization.sh if en is selected
sed -e "/\'acf_blocks\' \=\> \[/a\\
      [|\
       'name' => '§',|\
       'title' => 'µ',|\
      ],\\" < ${PROJECT_THEME_PATH}/functions.php | tr '|' '\n' | sed "s|§|${BLOCK_SLUG}|g" | sed "s|µ|${BLOCK_UI_TITLE}|g" > ${PROJECT_THEME_PATH}/tmpfile
