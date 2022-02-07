#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:09:25
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-07 15:47:43

# General vars
ENV_FILE="${HOME}/.env_createproject"

# Do we ask for lang or not
if grep -q "AIR_BLOCKS_LANG" ${ENV_FILE}; then
  # If found
  # Get var from env
  AIR_BLOCKS_LANG=$(grep AIR_BLOCKS_LANG $ENV_FILE | cut -d '=' -f2)
else
  # If not found
  echo ""

  # Ask language
  echo "${BOLDYELLOW}Block language:${TXTRESET}
${YELLOW}(Pro tip: Set up AIR_BLOCKS_LANG=en/fi to ${ENV_FILE} if you do not want this to get asked every time)${TXTRESET} "

  echo "
${BOLDGREEN}Available languages:${TXTRESET} "
  echo "en
fi
"

  # Read given lang
  read -e AIR_BLOCKS_LANG

  if ! [[ ${AIR_BLOCKS_LANG} = "fi" || ${AIR_BLOCKS_LANG} = "en" ]]; then
    echo "Language must be ${BOLDGREEN}en${TXTRESET} or ${BOLDGREEN}fi${TXTRESET}."
    exit
  fi
fi

echo ${AIR_BLOCKS_LANG}

# Ask block name
echo "
${BOLDYELLOW}Block name in lowercase (the one filtered in blocks.airwptheme.com):${TXTRESET} "

# Show available blocks
source ${SCRIPTS_LOCATION}/tasks/blocks-available.sh

# Add extra line break
echo ""

# Read given block name
read -e BLOCK_NAME

# Ask project name
echo "
${BOLDYELLOW}Project name in lowercase:${TXTRESET} "

# Read given project name
read -e PROJECT_NAME

# Ask theme name
echo "
${BOLDYELLOW}Theme name in lowercase (no spaces or special characters):${TXTRESET} "

# Read given theme name
read -e THEME_NAME

# Add these variables based on asked vars
export PROJECT_PATH="${PROJECTS_HOME}/${PROJECT_NAME}"
export PROJECT_THEME_PATH="${PROJECTS_HOME}/${PROJECT_NAME}/content/themes/${THEME_NAME}"
