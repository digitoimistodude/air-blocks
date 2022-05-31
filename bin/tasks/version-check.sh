#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-01-11 16:53:38
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-01-11 18:49:50
echo "
${YELLOW}Checking if we have supported version of the theme...${TXTRESET} "

export AIR_LIGHT_REQUIRED_VERSION="8.4.2"
export AIR_LIGHT_THEME_VERSION=$(cat ${PROJECT_THEME_PATH}/functions.php |grep AIR_LIGHT_VERSION |egrep -o '[0-9].*.[0-9]')

 if [ "$(printf '%s\n' "$AIR_LIGHT_REQUIRED_VERSION" "$AIR_LIGHT_THEME_VERSION" | sort -V | head -n1)" = "$AIR_LIGHT_REQUIRED_VERSION" ]; then
  # echo "Greater than or equal to ${AIR_LIGHT_REQUIRED_VERSION}"
  echo " "
 else
  echo "
${RED}The version of your theme '${THEME_NAME}' is ${WHITE}${AIR_LIGHT_THEME_VERSION}${RED}. Air-blocks require at least ${WHITE}${AIR_LIGHT_REQUIRED_VERSION}${RED}. Sorry. The newtheme script will now quit...${TXTRESET}
"
  exit
 fi

echo "
${YELLOW}Checking if we have theme with ACF blocks support...${TXTRESET} "

if [[ -d "${PROJECT_THEME_PATH}/template-parts/blocks" ]]; then
  echo " "
else
  echo "
${RED}Your theme does not have ACF blocks support. Please check from docs.airwptheme.com and install the newest theme with block support. The newtheme script will now quit...${TXTRESET}
"
  exit
fi
