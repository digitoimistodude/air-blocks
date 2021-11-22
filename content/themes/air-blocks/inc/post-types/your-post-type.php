<?php
/**
 * @Author: Niku Hietanen
 * @Date: 2020-02-18 15:06:45
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-05-04 11:13:10
 *
 * @package airblocks
 **/

namespace Air_Light;

/**
 * Registers the Your Post Type post type.
 */
class Your_Post_Type extends Post_Type {

  public function register() {

    // Modify all the i18ized strings here.
    $generated_labels = [
      'menu_name'          => __( 'Your Post Type', 'airblocks' ),
      'name'               => _x( 'Your Post Types', 'post type general name', 'airblocks' ),
      'singular_name'      => _x( 'Your Post Type', 'post type singular name', 'airblocks' ),
      'name_admin_bar'     => _x( 'Your Post Type', 'add new on admin bar', 'airblocks' ),
      'add_new'            => _x( 'Add New', 'thing', 'airblocks' ),
      'add_new_item'       => __( 'Add New Your Post Type', 'airblocks' ),
      'new_item'           => __( 'New Your Post Type', 'airblocks' ),
      'edit_item'          => __( 'Edit Your Post Type', 'airblocks' ),
      'view_item'          => __( 'View Your Post Type', 'airblocks' ),
      'all_items'          => __( 'All Your Post Types', 'airblocks' ),
      'search_items'       => __( 'Search Your Post Types', 'airblocks' ),
      'parent_item_colon'  => __( 'Parent Your Post Types:', 'airblocks' ),
      'not_found'          => __( 'No your post types found.', 'airblocks' ),
      'not_found_in_trash' => __( 'No your post types found in Trash.', 'airblocks' ),
    ];

    // Definition of the post type arguments. For full list see:
    // http://codex.wordpress.org/Function_Reference/register_post_type
    $args = [
      'labels'              => $generated_labels,
      'description'         => '',
      'menu_icon'           => null,
      'public'              => false,
      'has_archive'         => false,
      'exclude_from_search' => false,
      'show_ui'             => true,
      'show_in_menu'        => true,
      'show_in_rest'        => false,
      'rewrite'             => [
        'with_front'  => false,
        'slug'        => 'your-post-type',
      ],
      'supports'            => [ 'title', 'editor', 'thumbnail', 'revisions' ],
      'taxonomies'          => [],
    ];

    $this->register_wp_post_type( $this->slug, $args );
  }
}
