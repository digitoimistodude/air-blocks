<?php
/**
 * TODO: Add here the name and meaning of this file, hooks.php
 *
 * TODO: Add description here for this filefile called hooks.
 *
 * @Author:		Roni Laukkarinen
 * @Date:   		2021-11-18 15:12:35
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-12-13 14:42:01
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

/**
 * All hooks that are run in the theme are listed here
 *
 * @package airblocks
 */

namespace Air_Light;

/**
 * Enable search view
 */
// add_filter( 'air_helper_disable_views_search', '__return_false' );

/**
 * Disable media library path because wp replaces media so that the domain will be airmediatheme.com...
 */
add_filter( 'air_helper_change_uploads_path', '__return_false' );

/**
 * Breadcrumb
 */
// require get_theme_file_path( 'inc/hooks/breadcrumb.php' );

/**
 * General hooks
 */
require get_theme_file_path( 'inc/hooks/general.php' );
add_action( 'widgets_init', __NAMESPACE__ . '\widgets_init' );
add_filter( 'air_helper_custom_settings_post_ids', __NAMESPACE__ . '\custom_settings_post_ids' );

/**
 * Scripts and styles associated hooks
 */
require get_theme_file_path( 'inc/hooks/scripts-styles.php' );
add_action( 'wp_enqueue_scripts', __NAMESPACE__ . '\enqueue_polyfills' );
add_action( 'wp_enqueue_scripts', __NAMESPACE__ . '\enqueue_theme_scripts' );

// NB! If you use ajax functionality in Gravity Forms, remove this line
// to prevent Uncaught ReferenceError: jQuery is not defined
// add_action( 'wp_default_scripts', __NAMESPACE__ . '\move_jquery_into_footer' );

/**
 * Gutenberg associated hooks
 */
require get_theme_file_path( 'inc/hooks/gutenberg.php' );
add_filter( 'allowed_block_types_all', __NAMESPACE__ . '\allowed_block_types', 10, 2 );
add_filter( 'use_block_editor_for_post_type', __NAMESPACE__ . '\use_block_editor_for_post_type', 10, 2 );
add_action( 'enqueue_block_editor_assets', __NAMESPACE__ . '\register_block_editor_assets' );
add_filter( 'block_editor_settings_all', __NAMESPACE__ . '\remove_gutenberg_inline_styles', 10, 2 );
add_action( 'after_setup_theme', __NAMESPACE__ . '\setup_editor_styles' );
add_action( 'enqueue_block_editor_assets', __NAMESPACE__ . '\block_editor_title_input_styles' );

/**
 * ACF blocks
 */
require get_theme_file_path( 'inc/hooks/acf-block-example-data.php' );
add_filter( 'air_acf_blocks_example_data', __NAMESPACE__ . '\set_acf_blocks_example_data', 10, 1 );

require get_theme_file_path( 'inc/hooks/acf-blocks.php' );
add_filter( 'block_categories_all', __NAMESPACE__ . '\acf_blocks_add_category_in_gutenberg', 10, 2 );
add_action( 'acf/init', __NAMESPACE__ . '\acf_blocks_init' );

/**
 * Dynamic svg icon select
 */
require get_theme_file_path( 'inc/hooks/admin/acf-dynamic-icon-select.php' );
add_filter( 'acf/load_field/type=select', __NAMESPACE__ . '\acf_dynamic_select_for_icon' );
add_action( 'acf/input/admin_head', __NAMESPACE__ . '\improved_acf_svg_selector_ui_styles' );

/**
 * Form related hooks
 */
require get_theme_file_path( 'inc/hooks/forms.php' );
add_action( 'gform_enqueue_scripts', __NAMESPACE__ . '\dequeue_gf_stylesheets', 999 );
