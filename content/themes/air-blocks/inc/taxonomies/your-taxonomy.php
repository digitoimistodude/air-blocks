<?php
/**
 * @Author: Niku Hietanen
 * @Date: 2020-02-18 15:05:35
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-05-04 11:13:17
 *
 * @package airblocks
 */

namespace Air_Light;

/**
 * Registers the Your Taxonomy taxonomy.
 *
 * @param Array $post_types Optional. Post types in
 * which the taxonomy should be registered.
 */
class Your_Taxonomy extends Taxonomy {


  public function register( array $post_types = [] ) {
    // Taxonomy labels.
    $labels = [
      'name'                  => _x( 'Your Taxonomies', 'Taxonomy plural name', 'airblocks' ),
      'singular_name'         => _x( 'Your Taxonomy', 'Taxonomy singular name', 'airblocks' ),
      'search_items'          => __( 'Search Your Taxonomies', 'airblocks' ),
      'popular_items'         => __( 'Popular Your Taxonomies', 'airblocks' ),
      'all_items'             => __( 'All Your Taxonomies', 'airblocks' ),
      'parent_item'           => __( 'Parent Your Taxonomy', 'airblocks' ),
      'parent_item_colon'     => __( 'Parent Your Taxonomy', 'airblocks' ),
      'edit_item'             => __( 'Edit Your Taxonomy', 'airblocks' ),
      'update_item'           => __( 'Update Your Taxonomy', 'airblocks' ),
      'add_new_item'          => __( 'Add New Your Taxonomy', 'airblocks' ),
      'new_item_name'         => __( 'New Your Taxonomy', 'airblocks' ),
      'add_or_remove_items'   => __( 'Add or remove Your Taxonomies', 'airblocks' ),
      'choose_from_most_used' => __( 'Choose from most used Taxonomies', 'airblocks' ),
      'menu_name'             => __( 'Your Taxonomy', 'airblocks' ),
    ];

    $args = [
      'labels'            => $labels,
      'public'            => false,
      'show_in_nav_menus' => true,
      'show_admin_column' => true,
      'hierarchical'      => true,
      'show_tagcloud'     => false,
      'show_ui'           => true,
      'query_var'         => false,
      'rewrite'           => [
        'slug' => 'your-taxonomy',
      ],
    ];

    $this->register_wp_taxonomy( $this->slug, $post_types, $args );
  }

}
