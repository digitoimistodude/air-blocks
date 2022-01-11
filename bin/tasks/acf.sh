#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:26:55
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2021-11-23 18:40:41

# Let's ensure we have acf-json folder
mkdir -p ${PROJECT_THEME_PATH}/acf-json

# Ensure file permissions for that folder
chmdo -R 777 ${PROJECT_THEME_PATH}/acf-json
