<?php
/**
 * The template for hero-full-height
 *
 * Description of the file called
 * hero-full-height.
 *
 * @Author:		Elias Kautto
 * @Date:   		2021-11-10 16:02:02
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-26 10:46:36
 *
 * @package airblocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

if ( ! isset( $args ) ) {
  $upper_title = get_field( 'upper_title' );
  $title = get_field( 'title' );
  $content = get_field( 'content' );
  $button = get_field( 'button' );
  $video = get_field( 'video' );
  $bg_image = get_field( 'bg_image' );

  if ( empty( $bg_image ) ) {
    $bg_image = get_post_thumbnail_id( get_the_ID() );
  }
} else {
  $upper_title = $args['upper_title'];
  $title = $args['title'];
  $content = $args['content'];
  $button = $args['button'];
  $bg_image = $args['bg_image'];
  $video = $args['video'];
}

$style = 'low';
if ( ! empty( get_field( 'style' ) ) ) {
  $style = get_field( 'style' );
}

if ( empty( $title ) ) {
  maybe_show_error_block( 'Otsikko on pakollinen' );
  return;
}
?>

<section class="block block-hero-full-height block-hero-<?php echo esc_attr( $style ) ?>">
  <div class="shade" aria-hidden="true"></div>
  <div class="container">

    <?php vanilla_lazyload_div( $bg_image ); ?>

    <?php if ( ! empty( $video ) ) : ?>
      <video src="<?php echo esc_url( $video['url'] ); ?>" loop muted autoplay></video>
    <?php endif; ?>

    <div class="content">
      <div class="content-wrapper">

        <?php if ( ! empty( $upper_title ) ) { ?>
          <p class="prefix">
            <?php echo esc_html( $upper_title ); ?>
          </p>
        <?php } ?>

        <h1 class="heading-hero" id="content">
          <?php echo esc_html( $title ); ?>
        </h1>

        <?php if ( ! empty( $content ) ) :
          echo wp_kses_post( wpautop( $content ) );
        endif;

        if ( ! empty( $button ) ) : ?>
          <p class="button-wrapper">
            <a class="button button-large<?php if ( str_contains( $button['url'], '#' ) ) echo ' js-trigger'; ?>" href="<?php echo esc_url( $button['url'] ); ?>">
              <?php echo esc_html( $button['title'] ); ?>
            </a>
          </p>
        <?php endif; ?>
      </div>
    </div>

  </div>
</section>
