<?php
/**
 * Carousel
 *
 * Carousel block.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-15 10:20:37
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-03-09 10:45:17
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

$images = get_field( 'images' );

if ( empty( $images ) ) {
maybe_show_error_block( 'Lisää vähintään yksi kuva' );
return;
}

?>

<section class="block block-carousel">
  <div class="container">

    <div class="controls-buttons"></div>

    <div class="slider">

      <?php foreach ( $images as $image ) : ?>
        <div class="slider-slide">
          <img src="<?php echo esc_url( $image['url'] ); ?>" alt="<?php echo esc_html( $image['alt'] ); ?>">
        </div>
      <?php endforeach; ?>

    </div>

  </div>
</section>
