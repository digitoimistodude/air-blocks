<?php
/**
 * Gather all bits and pieces together.
 * If you end up having multiple post types, taxonomies,
 * hooks and functions - please split those to their
 * own files under /inc and just require here.
 *
 * @Date: 2019-10-15 12:30:02
 * @Last Modified by:   Tuomas Marttila
<<<<<<< HEAD
 * @Last Modified time: 2021-12-15 08:42:29
=======
 * @Last Modified time: 2021-12-15 10:21:04
>>>>>>> block-carousel
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
        'name'           => 'hero',
        'title'          => 'Sivun yläosa',
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
        'title' => 'Tekstipalstat ikoneilla',
      ],
      [
        'name'  => 'image-content-columns',
        'title' => 'Tekstipalstat kuvilla',
      ],
      [
        'name'  => 'image-content',
        'title' => 'Kuva ja tekstisisältö vierekkäin',
      ],
      [
<<<<<<< HEAD
        'name'  => 'form',
        'title' => 'Lomake',
=======
        'name'  => 'carousel',
        'title' => 'Kuvakaruselli',
>>>>>>> block-carousel
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
    // Set the value to 'all' to allow all blocks everywhere
   'allowed_blocks' => [
      'default' => [
      ],
      'post' => [
        'core/archives',
        'core/audio',
        'core/buttons',
        'core/categories',
        'core/code',
        'core/column',
        'core/columns',
        'core/coverImage',
        'core/embed',
        'core/file',
        'core/freeform',
        'core/gallery',
        'core/heading',
        'core/html',
        'core/image',
        'core/latestComments',
        'core/latestPosts',
        'core/list',
        'core/more',
        'core/nextpage',
        'core/paragraph',
        'core/preformatted',
        'core/pullquote',
        'core/quote',
        'core/block',
        'core/separator',
        'core/shortcode',
        'core/spacer',
        'core/subhead',
        'core/table',
        'core/textColumns',
        'core/verse',
        'core/video',
      ],
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
