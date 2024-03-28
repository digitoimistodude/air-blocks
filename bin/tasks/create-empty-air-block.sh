#!/bin/bash
# @Author: Roni Äikäs
# @Date:   2024-03-28 23:02:24
# @Last Modified by:   Roni Äikäs
# @Last Modified time: 2024-03-28 23:02:24

if [ -f "${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG}.php" ]; then
  echo "
${RED}Block already exists. The newtheme script will now quit...${TXTRESET}
  "
  exit
else
 # The block file
  echo "<?php
  /**
   * Name:              ${BLOCK_SLUG}
   * Title:             ${BLOCK_UI_TITLE}
   * Category:          ${PROJECT_NAME}
   * Description:       A Gutenberg block!
   * Icon:              block-default
   */

  // Register attributes
  register_rich_text( 'title' );
  // register_attribute( 'attribute_name', 'Attribute Label', 'string', 'Default Value!' );
  // register_rich_text( 'attribute_name', 'Default Value!' );

  // Get fields
  \$title = attr( 'title' );
  ?>

  <section class=\"block block-${BLOCK_SLUG}\">
    <div class=\"container\">

      <h2 wp-rich=\"title\">
        <?php echo esc_html( \$title ); ?>
      </h2>

      <!-- Start coding here -->
    </div>
  </section>" > ${PROJECT_THEME_PATH}/template-parts/blocks/${BLOCK_SLUG}.block.php

  # Styles for block
  echo ".block-${BLOCK_SLUG} {
  // Your block styles here
}" > ${PROJECT_THEME_PATH}/sass/gutenberg/blocks/_${BLOCK_SLUG}.scss

  # Import block styles to _blocks.scss
  sed -e "/\/\/ ACF blocks/a\\
  @import 'gutenberg/blocks/${BLOCK_SLUG}';" < ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss > ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks_with_changes.scss
  rm ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss
  mv ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks_with_changes.scss ${PROJECT_THEME_PATH}/sass/gutenberg/_blocks.scss

  # Block icon
  mkdir -p ${PROJECT_THEME_PATH}/svg/block-icons

  # There is no block icon so we can't copy it, but let's keep this as a placeholder if we get some default in the future
  #cp -nv ${AIRBLOCKS_THEME_PATH}/svg/block-icons/${BLOCK_SLUG}.svg ${PROJECT_THEME_PATH}/svg/block-icons/
fi

# TODO: add block to the functions.php