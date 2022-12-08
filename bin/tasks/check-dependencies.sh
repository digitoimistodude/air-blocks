#!/bin/bash

# Check if block is registered with the same name
if grep -q \'"$BLOCK_NAME"\' ${PROJECT_THEME_PATH}/functions.php; then
  echo "
${RED}Found exactly the same block name registered in functions.php... The script will now quit.${TXTRESET}
" 1>&2
  exit
else
  # If not found, continue
  echo "${GREEN}✓ Block name OK.${TXTRESET}" 1>&2
fi

# Let's ensure we have acf-json folder
mkdir -p ${PROJECT_THEME_PATH}/acf-json

# Ensure file permissions for that folder
source ${SCRIPTS_LOCATION}/tasks/permissions.sh

# Create blocks directory if it does not exist
mkdir -p ${PROJECT_THEME_PATH}/template-parts/blocks

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
  echo "${GREEN}✓ ACF_PRO_KEY found globally.${TXTRESET}" 1>&2
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

  if [[ -z $ACF_PRO_KEY ]]; then
    echo "${RED}No key given. The newtheme script will now quit...${TXTRESET}
"
    exit
  fi
fi

# Let's check the project env
if grep -q "ACF_PRO_KEY" ${ENV_FILE_PROJECT}; then
  echo "${GREEN}✓ ACF_PRO_KEY found in project .env.${TXTRESET}" 1>&2
else
  # If not found
  # Add to project env
  echo "
ACF_PRO_KEY=${ACF_PRO_KEY}" >> ${ENV_FILE_PROJECT}
fi

# Let's check if acf-composer-bridge is found in composer.json
if grep -q "acf-composer-bridge" ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json; then
  echo "${GREEN}✓ acf-composer-bridge already set up.${TXTRESET}" 1>&2
else
  # If not found
  echo "${BOLDYELLOW}Adding acf-composer-bridge to composer.json...${TXTRESET}" 1>&2

  # Update composer.json repositories
  sed -e "/\"repositories\"\: \[/a\\
      \{|\
        \"type\": \"composer\"\,|\
        \"url\"\: \"https:\/\/pivvenit.github.io\/acf-composer-bridge\/composer\/v3\/wordpress-plugin\/\"|\
      \},\\" < ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json | tr '|' '\n' > ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json
  rm ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json
  mv ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json
fi

# Let's check if advanced-custom-fields-pro is found in composer.json
if grep -q "advanced-custom-fields-pro" ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json; then
  echo "${GREEN}✓ advanced-custom-fields-pro already set up.${TXTRESET}" 1>&2
else
  # If not found
  echo "${BOLDYELLOW}Adding advanced-custom-fields-pro to composer.json require...${TXTRESET}" 1>&2

  # Update composer.json require
  sed -e "/\"require\"/a\\
      \"advanced-custom-fields/advanced-custom-fields-pro\"\: \"\*\"\," < ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json | tr '|' '\n' > ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json
  rm ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json
  mv ${PROJECTS_HOME}/${PROJECT_NAME}/composer_with_changes.json ${PROJECTS_HOME}/${PROJECT_NAME}/composer.json

  # Let's go to the project directory
  cd ${PROJECTS_HOME}/${PROJECT_NAME}

  # Install composer plugins
  composer update
  composer install

  # Activate ACF plugin
  ./vendor/wp-cli/wp-cli/bin/wp plugin activate advanced-custom-fields-pro

fi
