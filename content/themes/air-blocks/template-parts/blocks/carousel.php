<?php
/**
 * Carousel
 *
 * Carousel block.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-15 10:20:37
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-06-07 16:43:04
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

if ( ! isset( $args ) ) {
  $title = get_field( 'title' );
} else {
  $title = $args['title'];
}

$images = get_field( 'images' );

if ( empty( $images ) ) {
  maybe_show_error_block( 'Lisää vähintään yksi kuva' );
  return;
}

?>

<section class="block block-carousel">
  <div class="container">

    <h2 class="screen-reader-text">
      <?php echo esc_html( $title ); ?>
    </h2>

    <div class="swiper-container">

      <div class="swiper-controls" aria-hidden="true">
        <button class="swiper-actions swiper-button-prev">
          <?php include get_theme_file_path( '/svg/slider-left-arrow.svg' ); ?>
        </button>

        <button class="swiper-actions swiper-button-next">
          <?php include get_theme_file_path( '/svg/slider-right-arrow.svg' ); ?>
        </button>
      </div>

      <ul class="quotes swiper-wrapper">
        <?php foreach ( $images as $image ) : ?>
          <li class="swiper-slide">
            <img src="<?php echo esc_url( $image['url'] ); ?>" alt="<?php echo esc_html( $image['alt'] ); ?>">
          </li>
        <?php endforeach; ?>
      </ul>

    </div>

  </div>
</section>
