<?php
/**
 * Call to Action (CTA)
 *
 * Block for call to action elements.
 *
 * @Author: Roni Laukkarinen
 * @Date: 2021-08-24 15:45:19
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-03-09 10:46:14
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

use function WP_CLI\Utils\maybe_require;

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

if ( empty( $link ) || ! array_key_exists( 'url', $link ) ) {
  maybe_show_error_block( 'Linkki on pakollinen' );
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

      <p class="button-wrapper">
        <a class="button" href="<?php echo esc_url( $link['url'] ) ?>">
          <?php echo esc_html( $link['title'] ) ?>
          <?php include get_theme_file_path( '/svg/arrow-right.svg' ); ?>
        </a>
      </p>

    </div>
  </div>
</section>
