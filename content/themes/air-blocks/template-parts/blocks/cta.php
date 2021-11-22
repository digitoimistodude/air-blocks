<?php
/**
 * @Author: Roni Laukkarinen
 * @Date: 2021-08-24 15:45:19
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-22 19:15:20
 *
 * @package air-blocks
 */

namespace Air_Light;

$title = get_field( 'title' );
$content = get_field( 'content' );
$link = get_field( 'link' );

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
        <p><?php echo esc_html( $content ) ?></p>
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
