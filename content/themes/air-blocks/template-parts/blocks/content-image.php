<?php
/**
 * Image and content
 *
 * A block for image and content side by side.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-14 12:42:52
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-12-18 21:37:33
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

// Fields
$title = get_field( 'title' );
$image_side = get_field( 'media_side' );
$content = get_field( 'content' );
$image = get_field( 'image' );
$link = get_field( 'link' );

if ( empty( $image ) || empty( $content ) ) {
  maybe_show_error_block( 'Kuva ja tekstisisältö ovat pakollisia' );
  return;
}
?>

<section class="block block-content-image image-<?php echo esc_html( $image_side ) ?>">
  <div class="container">

    <div class="col col-content">

      <div class="wrapper">
        <?php if ( ! empty( $title ) ) : ?>
          <h2>
            <?php echo wp_kses_post( $title ); ?>
          </h2>
        <?php endif; ?>

          <?php echo wp_kses_post( wpautop( $content ) ); ?>

        <?php if ( ! empty( $link['url'] ) ) : ?>
          <p class="button-wrapper">
            <a href="<?php echo esc_url( $link['url'] ); ?>" class="button">
              <?php echo wp_kses_post( $link['title'] ); ?>
            </a>
          </p>
        <?php endif; ?>

      </div>

    </div>

    <div class="col col-image">
      <div class="image image-background">
        <?php native_lazyload_tag( $image ); ?>
      </div>
    </div>

  </div>
</section>
