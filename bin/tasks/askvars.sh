#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:09:25
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-02-24 17:09:27

# General vars
export ENV_FILE="${HOME}/.env_createproject"

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
  echo "1 en
2 fi
"

  # Read given lang
  read -e AIR_BLOCKS_LANG

  # Exit if not number between 0-2
  REGNUMBERS='^[0-9]+$'
  if ! [[ $AIR_BLOCKS_LANG =~ $REGNUMBERS ]] ; then
     echo "
${RED}Error: $AIR_BLOCKS_LANG is not a number.${TXTRESET}
  ";
     exit
  fi

  if ! [[ ${AIR_BLOCKS_LANG} = "1" || ${AIR_BLOCKS_LANG} = "2" ]]; then
    echo "Language must be ${BOLDGREEN}1 {TXTRESET}(en) or ${BOLDGREEN}2 ${TXTRESET}(fi)."
    exit
  fi

  if [[ ${AIR_BLOCKS_LANG} = 1 ]]; then
    AIR_BLOCKS_LANG="en"
  fi

  if [[ ${AIR_BLOCKS_LANG} = 2 ]]; then
    AIR_BLOCKS_LANG="fi"
  fi
fi

# Ask block name
echo "
${BOLDYELLOW}Select block (number):${TXTRESET} "

# Show available blocks
source ${SCRIPTS_LOCATION}/tasks/blocks-available.sh

# Add extra line break
echo ""

# Read given block number
read -e BLOCK_NUMBER

# Exit if not number
REGNUMBERSANDQUESTION='^[0-9\\?]+$'
if ! [[ $BLOCK_NUMBER =~ $REGNUMBERSANDQUESTION ]] ; then
   echo "
${RED}Error: $BLOCK_NUMBER is not one of the choices.${TXTRESET}
";
   exit
fi

REGNUMBERS='^[0-9]+$'
if ! [[ $BLOCK_NUMBER =~ $REGNUMBERS ]] ; then

  # Set new block to true
  export IS_NEW_BLOCK="yes"

  # Ask block name
  echo "
${BOLDYELLOW}New block name (kebab-case):${TXTRESET} "

  # Read given block name
  read -e BLOCK_NAME

  # Ask block name
  echo "
${BOLDYELLOW}New block title shown in UI (without \"Block:\" text, for example: Two columns):${TXTRESET} "

  # Read given block ui title
  read -e BLOCK_UI_TITLE

else

  # Ask block name
  echo "
${BOLDYELLOW}Rename block? (y/n):${TXTRESET} "

  # Set renamed to true
  export IS_RENAMED_BLOCK="yes"

  # Read answer y/n
  read -e RENAME_BLOCK

  # If we want to rename the block
  if [ "$RENAME_BLOCK" = "y" ]; then

    # Ask new block name
    echo "
${BOLDYELLOW}Rename block name to this block name (kebab-case):${TXTRESET} "

    # Read given block name
    read -e BLOCK_NAME_TO_RENAME_TO
    export BLOCK_NAME_TO_RENAME_TO="${BLOCK_NAME_TO_RENAME_TO}"

    # Ask new block name
    echo "
${BOLDYELLOW}Rename block title shown in UI (without \"Block:\" text, for example: Two columns):${TXTRESET} "

    # Read given block ui title
    read -e BLOCK_UI_TITLE_TO_RENAME_TO
    export BLOCK_UI_TITLE_TO_RENAME_TO="${BLOCK_UI_TITLE_TO_RENAME_TO}"

    # Select block by number
    export BLOCK_NAME=`ls -1 "${SCRIPTS_LOCATION}/blocks" | sed -n ${BLOCK_NUMBER}p | sed -e 's/\.sh$//'`

  # If we use the global block name
  else

    # Set new block to true
    export IS_NEW_BLOCK="no"

    # Select block by number
    export BLOCK_NAME=`ls -1 "${SCRIPTS_LOCATION}/blocks" | sed -n ${BLOCK_NUMBER}p | sed -e 's/\.sh$//'`

  fi
fi

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

# Env file for project
export ENV_FILE_PROJECT="${PROJECT_PATH}/.env"
