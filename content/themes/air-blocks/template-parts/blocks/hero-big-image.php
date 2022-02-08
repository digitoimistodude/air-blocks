<?php
/**
 * @Author:		Elias Kautto
 * @Date:   		2022-02-02 13:09:31
 * @Last Modified by:   Tuomas Marttila
 * @Last Modified time: 2022-02-08 10:16:43
 *
 * @package lhkk
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

if ( ! isset( $args ) ) {
  $title = get_field( 'title' );
  $content = get_field( 'content' );
  $link = get_field( 'link' );
  $bg_image = get_field( 'bg_image' );

  if ( empty( $bg_image ) ) {
    $bg_image = get_post_thumbnail_id( get_the_ID() );
  }
} else {
  $title = $args['title'];
  $content = $args['content'];
  $link = $args['link'];
  $bg_image = $args['bg_image'];
}

if ( empty( $title ) ) {
  maybe_show_error_block( 'Otsikko on pakollinen' );
  return;
}
?>

<section class="block block-hero block-hero-big-image has-light-bg">
  <div class="image has-lazyload" aria-hidden="true">
    <?php native_lazyload_tag( $bg_image ); ?>

      <div class="container">
        <div class="content">
          <div class="content-wrapper">

            <h1 id="content">
              <?php echo esc_html( $title ); ?>
            </h1>

            <?php if ( ! empty( $content ) ) :
              echo wp_kses_post( wpautop( $content ) );
            endif;

            if ( ! empty( $link ) ) : ?>
              <p class="button-wrapper">
                <a class="button button-large<?php if ( str_contains( $link['url'], '#' ) ) echo ' js-trigger'; ?>" href="<?php echo esc_url( $link['url'] ); ?>">
                  <?php echo esc_html( $button['title'] ); ?>
                </a>
              </p>
            <?php endif; ?>
          </div>
        </div>
      </div>

    </div>
</section>
