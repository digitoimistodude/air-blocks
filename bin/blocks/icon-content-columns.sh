#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2022-08-18 15:11:23
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2022-08-18 15:11:23

# // New files/Dependencies (this file will install them):
# // ├── inc/hooks/admin/acf-dynamic-icon-select.php
# // ├── sass/gutenberg/blocks/_icon-content-columns.scss
# // ├── svg/block-icons/icon-content-columns.svg
# // ├── svg/foruser/block.svg
# // ├── svg/foruser/cloud.svg
# // └── svg/foruser/database.svg

# // Changes to files/folders:
# // ├── sass/gutenberg/_blocks.scss
# // ├── acf-json/
# // ├── inc/hooks.php
# // └── functions.php

# Block specific variables
export BLOCK_ACF_JSON_FILE="group_61b74f15bcf47.json"
export BLOCK_ACF_JSON_PATH="${AIRBLOCKS_THEME_PATH}/acf-json/${BLOCK_ACF_JSON_FILE}"
export BLOCK_UI_TITLE="Tekstipalstat kuvakkeilla"

# Create admin folder, if it doesn't exist
mkdir -p "${PROJECT_THEME_PATH}/inc/hooks/admin"

# Copy inc/hooks/admin/acf-dynamic-icon-select.php
cp -nv "${AIRBLOCKS_THEME_PATH}/inc/hooks/admin/acf-dynamic-icon-select.php" "${PROJECT_THEME_PATH}/inc/hooks/admin/acf-dynamic-icon-select.php"

# If acf-dynamic-icon-select is not found in functions.php, add it in the bottom
if ! grep -q "acf-dynamic-icon-select" "${PROJECT_THEME_PATH}/functions.php"; then
  echo "Adding acf-dynamic-icon-select to functions.php"
  echo "
  /**
   * Dynamic svg icon select
   */
  require get_theme_file_path( 'inc/hooks/admin/acf-dynamic-icon-select.php' );
  add_filter( 'acf/load_field/type=select', __NAMESPACE__ . '\acf_dynamic_select_for_icon' );
  add_action( 'acf/input/admin_head', __NAMESPACE__ . '\improved_acf_svg_selector_ui_styles' );
  " >> "${PROJECT_THEME_PATH}/functions.php"
fi
