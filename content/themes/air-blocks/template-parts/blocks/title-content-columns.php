<?php
/**
 * The template for title-content-columns
 *
 * Description of the file called
 * title-content-columns.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-13 12:23:42
 * @Last Modified by:   Tuomas Marttila
 * @Last Modified time: 2021-12-13 12:24:28
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

// Files (required):
// ├── sass/gutenberg/blocks/_title-content-columns.scss
// ├── svg/block-icons/title-content-columns.svg

namespace Air_Light;

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

