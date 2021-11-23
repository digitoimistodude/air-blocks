#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:26:55
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2021-11-23 18:40:41
echo "${YELLOW}Replacing block files with your theme name and textdomain called ${THEME_NAME}${TXTRESET}"
# THE magical sed command by rolle (goes through every single file in theme folder and searchs and replaces every instance with THEME_NAME):
for i in `grep -rl air-blocks * --exclude-dir=node_modules 2> /dev/null`; do LC_ALL=C sed -i '' -e "s;air-light;${THEME_NAME};" $i $i; done
for i in `grep -rl Air-blocks * --exclude-dir=node_modules 2> /dev/null`; do LC_ALL=C sed -i '' -e "s;Air-light;${THEME_NAME};" $i $i; done
for i in `grep -rl airblocks * --exclude-dir=node_modules 2> /dev/null`; do LC_ALL=C sed -i '' -e "s;air-light;${THEME_NAME};" $i $i; done
for i in `grep -rl airblocks * --exclude-dir=node_modules 2> /dev/null`; do LC_ALL=C sed -i '' -e "s;air_light_;${THEME_NAME}_;" $i $i; done
for i in `grep -rl airblocks * --exclude-dir=node_modules 2> /dev/null`; do LC_ALL=C sed -i '' -e "s;Air_light_;${THEME_NAME}_;" $i $i; done
