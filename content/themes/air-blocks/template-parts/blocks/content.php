<?php
/**
 * Content
 *
 * WYSIWYG content block.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2022-01-04 11:40:09
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-03-09 10:49:04
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

$content = get_field( 'content' );

if ( empty( $content ) ) {
  maybe_show_error_block( 'Tekstisisältö on pakollinen' );
  return;
}
?>

<section class="block block-content">
  <div class="container">
    <?php echo wp_kses_post( wpautop( $content ) ); ?>
  </div>
</section>
