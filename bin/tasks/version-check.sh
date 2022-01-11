#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-01-11 16:53:38
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-01-11 18:03:50
echo "
${YELLOW}Checking if we have supported version of the theme...${TXTRESET} "

export AIR_LIGHT_REQUIRED_VERSION="7.0.1"
export AIR_LIGHT_THEME_VERSION=$(cat ${PROJECT_THEME_PATH}/functions.php |grep AIR_LIGHT_VERSION |egrep -o '[0-9].*.[0-9]')

 if [ "$(printf '%s\n' "$AIR_LIGHT_REQUIRED_VERSION" "$AIR_LIGHT_THEME_VERSION" | sort -V | head -n1)" = "$AIR_LIGHT_REQUIRED_VERSION" ]; then
  # echo "Greater than or equal to ${AIR_LIGHT_REQUIRED_VERSION}"
  echo " "
 else
  echo "
  ${RED}The version of ${THEME_NAME} theme is ${AIR_LIGHT_REQUIRED_VERSION}. Air-blocks require at least ${AIR_LIGHT_REQUIRED_VERSION}. Sorry. The newtheme script will now quit...${TXTRESET}
  "
  exit
 fi
