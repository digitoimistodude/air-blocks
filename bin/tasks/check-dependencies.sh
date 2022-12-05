#!/bin/bash

# Let's go to the project directory
cd ${PROJECTS_HOME}/${PROJECT_NAME}

# Checking if composer is present
if ! command -v composer &> /dev/null; then
echo "
${RED}composer is not installed globally. The newtheme script will now quit...${TXTRESET}
"
exit
fi

# Let's check if env value exists for ACF
if grep -q "ACF_PRO_KEY" ${ENV_FILE}; then
  # If found
  # Get var from env
  echo "${GREEN}✓ ACF_PRO_KEY found, let's continue.${TXTRESET}" 1>&2
  export ACF_PRO_KEY=$(grep ACF_PRO_KEY $ENV_FILE | cut -d '=' -f2)
else
  # If not found
  echo ""

  # Ask ACF license key
  echo "${BOLDYELLOW}Advanced Custom Fields Pro license key:${TXTRESET}
${YELLOW}(Pro tip: Set up ACF_PRO_KEY=key to ${ENV_FILE} if you do not want this to get asked every time)${TXTRESET} "

  # Read given key
  read -e ACF_PRO_KEY
  export ACF_PRO_KEY
fi

# Let's check the project env
if grep -q "ACF_PRO_KEY" ${ENV_FILE_PROJECT}; then
  echo ""
else
  # If not found
  # Add to project env
  echo "
ACF_PRO_KEY=${ACF_PRO_KEY}" >> ${ENV_FILE_PROJECT}
fi

# Update composer.json repositories
sed -e "/\"repositories\"\: \[/a\\
    \{|\
      \"type\": \"composer\"\,|\
      \"url\"\: \"https:\/\/pivvenit.github.io\/acf-composer-bridge\/composer\/v3\/wordpress-plugin\/\"|\
      \}|\
    \},\\" < ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json | tr '|' '\n' > ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json
rm ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json
mv ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json

# Update composer.json require
sed -e "/require/a\\
    \"advanced-custom-fields-pro/advanced-custom-fields-pro\"\: \"\*\"\," < ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json | tr '|' '\n' > ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json
rm ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json
mv ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json

# Let's go to the project directory
cd ${PROJECTS_HOME}/${PROJECT_NAME}

# Install composer plugins
composer update
composer install

# Activate ACF plugin
./vendor/wp-cli/wp-cli/bin/wp plugin activate advanced-custom-fields-pro
