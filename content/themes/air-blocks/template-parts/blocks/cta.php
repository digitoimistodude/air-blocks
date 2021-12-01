<?php
/**
 * @Author: Roni Laukkarinen
 * @Date: 2021-08-24 15:45:19
 * @Last Modified by:   Timi Wahalahti
 * @Last Modified time: 2021-11-26 10:43:33
 *
 * @package air-blocks
 */

namespace Air_Light;

if ( ! isset( $args ) ) {
  $title = get_field( 'title' );
  $content = get_field( 'content' );
  $link = get_field( 'link' );
} else {
  $title = $args['title'];
  $content = $args['content'];
  $link = $args['link'];
}

if ( empty( $title ) ) {
  maybe_show_error_block( 'Otsikko on pakollinen' );
  return;
}
?>

<section class="block block-cta has-light-bg">
  <div class="container">
    <div class="cta">

      <div class="content">
        <h2><?php echo esc_html( $title ) ?></h2>

        <?php if ( ! empty( $content ) ) {
          echo wp_kses_post( wpautop( $content ) );
        } ?>
      </div>

      <?php if ( ! empty( $link ) && array_key_exists( 'url', $link ) ) : ?>
        <p class="button-wrapper">
          <a class="button" href="<?php echo esc_url( $link['url'] ) ?>">
            <?php echo esc_html( $link['title'] ) ?>
            <?php include get_theme_file_path( '/svg/arrow-right.svg' ); ?>
          </a>
        </p>
      <?php endif; ?>

    </div>
  </div>
</section>
