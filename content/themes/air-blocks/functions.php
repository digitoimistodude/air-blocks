<?php
/**
 * Gather all bits and pieces together.
 * If you end up having multiple post types, taxonomies,
 * hooks and functions - please split those to their
 * own files under /inc and just require here.
 *
 * @Date: 2019-10-15 12:30:02
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2023-01-06 22:03:52
 *
 * @package airblocks
 */

namespace Air_Light;

/**
 * The current version of the theme.
 */
define( 'AIR_LIGHT_VERSION', '8.1.8' );

// We need to have some defaults as comments or empties so let's allow this:
// phpcs:disable Squiz.Commenting.InlineComment.SpacingBefore, WordPress.Arrays.ArrayDeclarationSpacing.SpaceInEmptyArray

/**
 * Theme settings
 */
add_action( 'after_setup_theme', function() {
  $theme_settings = [
    /**
     * Theme textdomain
     */
    'textdomain' => 'airblocks',

    /**
     * Image and content sizes
     */
    'image_sizes' => [
      'small'   => 300,
      'medium'  => 700,
      'large'   => 1200,
    ],
    'content_width' => 800,

    /**
     * Logo and featured image
     */
    'default_featured_image'  => null,
    'logo'                    => '/svg/logo.svg',

    /**
     * Custom setting group post ids when using Air Helper's custom setting
     * feature and settings CPT. On multilingual sites using Polylang,
     * translations are handled automatically.
     */
    'custom_settings_post_ids' => [
      // 'setting-group' => 0,
    ],

    'social_media_accounts'  => [
      // 'twitter' => [
      //   'title' => 'Twitter',
      //   'url'   => 'https://twitter.com/digitoimistodude',
      // ],
    ],

    /**
     * Menu locations
     */
    'menu_locations' => [
      'primary' => __( 'Primary Menu', 'airblocks' ),
    ],

    /**
     * Taxonomies
     *
     * See the instructions:
     * https://github.com/digitoimistodude/airblocks#custom-taxonomies
     */
    'taxonomies' => [
      // 'your-taxonomy' => [
      //   'name' => 'Your_Taxonomy',
      //   'post_types' => [ 'post', 'page' ],
      // ],
    ],

    /**
     * Post types
     *
     * See the instructions:
     * https://github.com/digitoimistodude/airblocks#custom-post-types
     */
    'post_types' => [
      // 'your-post-type' => 'Your_Post_Type',
    ],

    /**
     * Gutenberg -related settings
     */
    // Register custom ACF Blocks
    'acf_blocks' => [
      [
        'name' => 'hero-full-height',
        'title' => 'Sivun korkea yläosa',
      ],
      [
        'name' => 'hero-big-image',
        'title' => 'Sivun yläosa isolla kuvalla',
      ],
      [
        'name' => 'hero-small-image',
        'title' => 'Sivun yläosa pienellä kuvalla',
      ],
      [
        'name'  => 'cta',
        'title' => 'Call to action',
      ],
      [
        'name'  => 'title-content-columns',
        'title' => 'Otsikko ja tekstisisältö palstoissa',
      ],
      [
        'name'  => 'content-columns-50-50',
        'title' => 'Kaksi tekstisisältöpalstaa',
      ],
      [
        'name'  => 'quote',
        'title' => 'Lainaus',
      ],
      [
        'name'  => 'icon-content-columns',
        'title' => 'Tekstipalstat kuvakkeilla',
      ],
      [
        'name'  => 'image-content-columns',
        'title' => 'Tekstipalstat kuvilla',
      ],
      [
        'name'  => 'content-image',
        'title' => 'Kuva ja tekstisisältö',
      ],
      [
        'name'  => 'form',
        'title' => 'Lomake',
        'prevent_cache' => true,
      ],
      [
        'name'  => 'carousel',
        'title' => 'Kuvakaruselli',
      ],
      [
        'name'  => 'content',
        'title' => 'Tekstisisältö',
      ],
      [
        'name'  => 'accordion',
        'title' => 'Haitari',
      ],
    ],

    // Custom ACF block default settings
    'acf_block_defaults' => [
      'category'          => 'airblocks',
      'mode'              => 'auto',
      'align'             => 'full',
      'post_types'        => [
        'page',
      ],
      'supports'          => [
        'align' => false,
      ],
      'render_callback'   => __NAMESPACE__ . '\render_acf_block',
    ],

    // Restrict to only selected blocks
    //
    // Options: 'none', 'all', 'all-core-blocks', 'all-acf-blocks',
    // or any specific block or a combination of these
    // Accepts both string (all*/none-options only) and array (options + specific blocks)
    'allowed_blocks' => [
      'post' => 'all-core-blocks',
      'page' => [],
      // 'page' => [
      //   'all-acf-blocks',
      //   'core/paragraph',
      // ],
      // 'post-type' => [
      //   'acf/content-image',
      //   'core/paragraph',
      // ],
      // 'example' => [
      //   'all-core-blocks',
      //   'acf/content-image',
      // ],
    ],

    // If you want to use classic editor somewhere, define it here
    'use_classic_editor' => [],

    // Add your own settings and use them wherever you need, for example THEME_SETTINGS['my_custom_setting']
    'my_custom_setting' => true,
  ];

  $theme_settings = apply_filters( 'airblocks_theme_settings', $theme_settings );

  define( 'THEME_SETTINGS', $theme_settings );
} ); // end action after_setup_theme

/**
 * Required files
 */
require get_theme_file_path( '/inc/hooks.php' );
require get_theme_file_path( '/inc/includes.php' );
require get_theme_file_path( '/inc/template-tags.php' );

// Run theme setup
add_action( 'init', __NAMESPACE__ . '\theme_setup' );
add_action( 'after_setup_theme', __NAMESPACE__ . '\build_theme_support' );

/**
 * Disable "Email delivery is not active or configured. Please contact your agency to fix this issue." notice
 */
add_filter( 'air_helper_mail_delivery', '__return_false' );

/**
 * Disable Air Helper change uploads path
 */
add_filter( 'air_helper_change_uploads_path', '__return_false' );
