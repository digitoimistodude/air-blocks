#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-16 14:44:59
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-08-18 15:12:19

# // New files/Dependencies (this file will install them):
# // ├── template-parts/blocks/form.php (automatic from get-block.sh)
# // ├── sass/gutenberg/blocks/_form.scss (automatic from get-block.sh)
# // ├── svg/block-icons/form.svg (automatic from get-block.sh)
# // └── inc/includes/acf-field-gravity-forms.php

# // Changes to files/folders:
# // ├── sass/gutenberg/_blocks.scss
# // ├── acf-json/
# // ├── sass/variables/_font-size.scss
# // ├── inc/includes.php
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_60acfb9d5db81.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"
export BLOCK_UI_TITLE="Lomake"

# Check if font-size is found
if grep -q "font-size-28" ${PROJECT_THEME_PATH}/sass/variables/_font-size.scss; then
  echo " "
else
# Import font-size to _font-size.scss
sed -e "/\/\/ Heading font sizes/a\\
  --font-size-28: 28px;" < ${PROJECT_THEME_PATH}/sass/variables/_font-size.scss > ${PROJECT_THEME_PATH}/sass/variables/_font-size_with_changes.scss
rm ${PROJECT_THEME_PATH}/sass/variables/_font-size.scss
mv ${PROJECT_THEME_PATH}/sass/variables/_font-size_with_changes.scss ${PROJECT_THEME_PATH}/sass/variables/_font-size.scss
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

# Let's check if env value exists for Gravity Forms
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

# Let's check the project env
if grep -q "WP_PLUGIN_GF_KEY" ${ENV_FILE_PROJECT}; then
  echo ""
else
  # If not found
  # Add to project env
  echo "
WP_PLUGIN_GF_KEY=${GF_LICENSE_KEY}" >> ${ENV_FILE_PROJECT}
fi

# Update composer.json repositories
sed -e "/\"repositories\"\: \[/a\\
    \{|\
      \"type\": \"package\"\,|\
      \"package\"\: \{|\
        \"name\"\: \"gravityforms\/gravityforms\"\,|\
        \"version\"\: \"2.5.14.3\"\,|\
        \"\type\"\: \"wordpress-plugin\"\,|\
        \"\dist\"\: \{|\
          \"type\"\: \"zip\"\,|\
          \"url\"\: \"https:\/\/www.gravityhelp.com\/wp-content\/plugins\/gravitymanager\/api.php\?op\=get_plugin\&slug=gravityforms\&key=\{\%WP_PLUGIN_GF_KEY\}\"|\
        \}\,|\
        \"require\"\: \{|\
          \"composer/installers\"\: \"\^1.4\"\,|\
          \"gotoandplay/gravityforms-composer-installer\"\: \"\^2.3\"|\
        \}|\
      \}|\
    \},\\" < ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json | tr '|' '\n' > ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json
rm ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json
mv ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json

# Let's go to the project directory
cd ${PROJECTS_HOME}/${PROJECT_NAME}

# Install composer plugins
composer update
composer install

# Install Gravity Forms
./vendor/wp-cli/wp-cli/bin/wp gf install --key=${GF_LICENSE_KEY}

# Activate gravity forms
./vendor/wp-cli/wp-cli/bin/wp plugin activate gravityforms

# Import default form
./vendor/wp-cli/wp-cli/bin/wp gf form import ${BLOCKS_PATH_TEMP}/gf-feedback-form.json

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

# Block specific localizations
if [[ ${AIR_BLOCKS_LANG} = "en" ]]; then
  sed -i '' -e 's/\Lomake/\form/
s/\"label\"\: \"Tekstin valinta/\"label\"\: \"Text choices/' ${PROJECT_THEME_PATH}/inc/includes/acf-field-gravity-forms.php
fi

# Deactivate gravity forms CLI plugin
./vendor/wp-cli/wp-cli/bin/wp plugin deactivate gravityformscli

# Uninstall gravity forms CLI plugin
./vendor/wp-cli/wp-cli/bin/wp plugin uninstall gravityformscli

# Let's ensure we're in the project directory
cd ${PROJECTS_HOME}/${PROJECT_NAME}

# Remove WP-CLI plugin for Gravity Forms from composer.json
composer remove wpackagist-plugin/gravityformscli

echo "
${BOLDGREEN}
.----------------------------------------------------------------- - -
| NOTE: Remember to disable Gravity Forms default CSS: https://${PROJECT_NAME}.test/wp/wp-admin/admin.php?page=gf_settings
| Also, tweak the font-size, especially variable --font-size-28 in _font-size.scss
| as a component or media queries if needed
'------------------------------------------------------- - - -
${TXTRESET}
"
