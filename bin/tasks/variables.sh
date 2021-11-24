#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:07:42
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2021-11-24 19:02:26
export PROJECTS_HOME="/var/www"
export DIR_TO_FILE=$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")
export CURRENTFILE=`basename $0`
export TXTBOLD=$(tput bold)
export BOLDYELLOW=${TXTBOLD}$(tput setaf 3)
export BOLDGREEN=${TXTBOLD}$(tput setaf 2)
export BOLDWHITE=${TXTBOLD}$(tput setaf 7)
export YELLOW=$(tput setaf 3)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export WHITE=$(tput setaf 7)
export TXTRESET=$(tput sgr0)
export LOCAL_IP=$(ifconfig | grep -Eo "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -Eo "([0-9]*\.){3}[0-9]*" | grep -v "127.0.0.1")
export YEAR=$(date +%y)
export CURRENTFILE=`basename $0`
export BLOCKS_PATH_TEMP="${HOME}/air-blocks"
export AIRBLOCKS_THEME_PATH="${BLOCKS_PATH_TEMP}/content/themes/air-blocks"
