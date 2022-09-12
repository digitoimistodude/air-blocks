<?php
/**
 * Title and content
 *
 * A block that shows title and content in WYSIWYG, side by side in two columns
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-13 12:23:42
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-09-12 13:51:09
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

// Files (required):
// ├── sass/gutenberg/blocks/_title-content-columns.scss
// ├── svg/block-icons/title-content-columns.svg

namespace Air_Light;

// Fields
$title = get_field( 'title' );
$content = get_field( 'content' );

if ( empty( $title ) || empty( $content ) ) {
  maybe_show_error_block( 'Otsikko ja tekstisisältö ovat pakollisia' );
  return;
}

?>

<section class="block block-title-content-columns">
  <div class="container">
    <h2>
      <?php echo esc_html( $title ) ?>
    </h2>
    <div class="content">
      <?php echo wp_kses_post( wpautop( $content ) ); ?>
    </div>
  </div>
</section>

