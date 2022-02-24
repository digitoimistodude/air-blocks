#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-16 14:44:59
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-24 16:58:26

# // New files/Dependencies (this file will install them):
# // ├── template-parts/blocks/form.php (automatic from get-block.sh)
# // ├── sass/gutenberg/blocks/_form.scss (automatic from get-block.sh)
# // ├── svg/block-icons/form.svg (automatic from get-block.sh)
# // └── inc/includes/acf-field-gravity-forms.php

# // Changes to files/folders:
# // ├── sass/gutenberg/_blocks.scss
# // ├── acf-json/
# // ├── sass/variables/_font-sizes.scss
# // ├── inc/includes.php
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_60acfb9d5db81.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"

# Check if font-size is found
if grep -q "font-size-28" ${ENV_FILE}; then
  echo ""
else
# Import font-size to _font-sizes.scss
sed -e "/\/\/ Heading font sizes/a\\
  --font-size-28: 28px;" < ${PROJECT_THEME_PATH}/sass/variables/_font-sizes.scss > ${PROJECT_THEME_PATH}/sass/variables/_font-sizes_with_changes.scss
rm ${PROJECT_THEME_PATH}/sass/variables/_font-sizes.scss
mv ${PROJECT_THEME_PATH}/sass/variables/_font-sizes_with_changes.scss ${PROJECT_THEME_PATH}/sass/variables/_font-sizes.scss
fi

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

# Activate gravity forms CLI plugin
./vendor/wp-cli/wp-cli/bin/wp plugin activate gravityformscli

# Do we ask for lang or not
if grep -q "GF_LICENSE_KEY" ${ENV_FILE}; then
  # If found
  # Get var from env
  export GF_LICENSE_KEY=$(grep GF_LICENSE_KEY $ENV_FILE | cut -d '=' -f2)
else
  # If not found
  echo ""

  # Ask Gravity Forms license key
  echo "${BOLDYELLOW}Gravity Forms license key:${TXTRESET}
${YELLOW}(Pro tip: Set up GF_LICENSE_KEY=key to ${ENV_FILE} if you do not want this to get asked every time)${TXTRESET} "

  # Read given key
  read -e GF_LICENSE_KEY
  export GF_LICENSE_KEY
fi

# Install Gravity Forms
./vendor/wp-cli/wp-cli/bin/wp gf install --key=${GF_LICENSE_KEY}

# Copy hook files
cp -nv ${AIRBLOCKS_THEME_PATH}/inc/includes/acf-field-gravity-forms.php ${PROJECT_THEME_PATH}/inc/includes/

# Check if include is not found
if grep -q "acf-field-gravity-forms.php" ${ENV_FILE}; then
  echo ""
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

.----------------------------------------------------------------- - -
| ${BOLDGREEN}NOTE: Remember to disable Gravity Forms default CSS: https://${PROJECT_NAME}.test/wp/wp-admin/admin.php?page=gf_settings${TXTRESET}
| Also, tweak the font-sizes, especially variable --font-size-28 in _font-sizes.scss
| as a component or media queries if needed
'------------------------------------------------------- - - -

"
