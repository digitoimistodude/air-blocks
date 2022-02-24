#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-16 14:44:59
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-24 16:21:11

# // New files/Dependencies (this file will install them):
# // ├── template-parts/blocks/form.php (automatic from get-block.sh)
# // ├── sass/gutenberg/blocks/_form.scss (automatic from get-block.sh)
# // ├── svg/block-icons/form.svg (automatic from get-block.sh)
# // └── inc/includes/acf-field-gravity-forms.php

# // Changes to files/folders:
# // ├── sass/gutenberg/_blocks.scss
# // ├── acf-json/
# // ├── inc/includes.php
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_60acfb9d5db81.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"

# Let's go to the project directory
cd ${PROJECTS_HOME}/${PROJECT_NAME}

# Checking if composer is present
if ! command -v composer &> /dev/null; then
echo "
${RED}composer is not installed globally. The newtheme script will now quit...${TXTRESET}
"
exit
fi

# Install and activate WP-CLI plugin for Gravity Forms
composer require wpackagist-plugin/gravityformscli

# Checking if WP CLI is present
if ! command -v wp &> /dev/null; then
echo "
${RED}WP-CLI is not installed globally. The newtheme script will now quit...${TXTRESET}
"
exit
fi
wp plugin activate gravityformscli

# Do we ask for lang or not
if grep -q "GF_LICENSE_KEY" ${ENV_FILE}; then
  # If found
  # Get var from env
  GF_LICENSE_KEY=$(grep GF_LICENSE_KEY $ENV_FILE | cut -d '=' -f2)
else
  # If not found
  echo ""

  # Ask Gravity Forms license key
  echo "${BOLDYELLOW}Gravity Forms license key:${TXTRESET}
${YELLOW}(Pro tip: Set up GF_LICENSE_KEY=key to ${ENV_FILE} if you do not want this to get asked every time)${TXTRESET} "

  # Read given key
  read -e GF_LICENSE_KEY
fi

# Install Gravity Forms
wp gf install

# Copy hook files
cp -nv ${AIRBLOCKS_THEME_PATH}/inc/includes/acf-field-gravity-forms.php ${PROJECT_THEME_PATH}/inc/includes/

# Check if include is not found
if grep -q "acf-field-gravity-forms.php" ${ENV_FILE}; then
else
  echo "
// Add Form field type for ACF
if ( class_exists( 'acf_field' ) ) {
  require get_theme_file_path( '/inc/includes/acf-field-gravity-forms.php' );
}
" >> ${PROJECT_THEME_PATH}/inc/includes.php
fi

# Register ACF block in functions.php
# Please note: The title of the block will be translated in localization.sh if en is selected
sed -e "/\'acf_blocks\' \=\> \[/a\\
      [|\
       'name' => 'form',|\
       'title' => 'Lomake',|\
      ],\\" < ${PROJECT_THEME_PATH}/functions.php | tr '|' '\n' > ${PROJECT_THEME_PATH}/tmpfile

echo "
${BOLDGREEN}NOTE: Remember to disable Gravity Forms default CSS: https://${PROJECT_NAME}.test/wp/wp-admin/admin.php?page=gf_settings${TXTRESET}
"
