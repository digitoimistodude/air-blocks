<?php
/**
 * Hero with big image.
 *
 * A hero variation with big image.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2022-02-08 09:45:56
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-09-12 13:49:55
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

// Files (required):
// ├── sass/gutenberg/blocks/_hero-big-image.scss
// ├── sass/components/_content-box.scss
// └── svg/block-icons/hero-big-image.svg

namespace Air_Light;

// Fields
$title = get_field( 'title' );
$content = get_field( 'content' );
$link = get_field( 'link' );
$bg_image = get_field( 'bg_image' );

if ( empty( $bg_image ) ) {
  $bg_image = get_post_thumbnail_id( get_the_ID() );
}

if ( empty( $title ) ) {
  maybe_show_error_block( 'Otsikko on pakollinen' );
  return;
}
?>

<section class="block block-hero-big-image">
  <div class="image image-background" aria-hidden="true">
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
                  <?php echo esc_html( $link['title'] ); ?>
                </a>
              </p>
            <?php endif; ?>
          </div>
        </div>
      </div>

    </div>
</section>
