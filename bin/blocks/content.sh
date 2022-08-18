#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-02-16 14:44:59
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-08-18 15:11:23

# // New files/Dependencies (this file will install them):
# // ├── sass/gutenberg/blocks/_content.scss (automatic from get-block.sh)
# // └── svg/block-icons/content.svg (automatic from get-block.sh)

# // Changes to files/folders:
# // ├── sass/gutenberg/_blocks.scss
# // ├── acf-json/
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_61d415b9e1978.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"
export BLOCK_UI_TITLE="Tekstisisältö"
