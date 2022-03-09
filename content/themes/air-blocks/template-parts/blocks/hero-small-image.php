<?php
/**
 * Hero with small image.
 *
 * A block for hero with small image.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2022-02-08 09:46:05
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-03-09 10:47:03
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

// Files (required):
// ├── sass/gutenberg/blocks/_hero-small-image.scss
// ├── sass/components/_content-box.scss
// └── svg/block-icons/hero-small-image.svg

namespace Air_Light;

if ( ! isset( $args ) ) {
  $title = get_field( 'title' );
  $content = get_field( 'content' );
  $image = get_field( 'image' );
  $mode = get_field( 'mode' );

  if ( 'link' === $mode ) {
    $link = get_field( 'link' );
  }

  if ( empty( $bg_image ) ) {
    $bg_image = get_post_thumbnail_id( get_the_ID() );
  }
} else {
  $title = $args['title'];
  $content = $args['content'];
  $image = $args['image'];
  $mode = $args['mode'];

  if ( 'link' === $args['mode'] ) {
    $link = $args['link'];
  }
}

if ( empty( $title ) ) {
  maybe_show_error_block( 'Otsikko on pakollinen' );
  return;
}
?>

<section class="block block-hero-small-image has-light-bg">
  <div class="container">

    <div class="image has-lazyload" aria-hidden="true">
      <?php native_lazyload_tag( $image ); ?>
    </div>

    <div class="content">
      <div class="content-wrapper">

        <h1 id="content">
          <?php echo esc_html( $title ); ?>
        </h1>

        <?php if ( ! empty( $content ) ) :
          echo wp_kses_post( wpautop( $content ) );
        endif;

        if ( 'link' === $mode && ! empty( $link ) ) : ?>
          <p class="button-wrapper">
            <a class="button button-large<?php if ( str_contains( $link['url'], '#' ) ) echo ' js-trigger'; ?>" href="<?php echo esc_url( $link['url'] ); ?>">
              <?php echo esc_html( $link['title'] ); ?>
            </a>
          </p>
        <?php elseif ( 'search' === $mode ) : ?>

          <div class="search">
            <form>
              <label for="input-text"><?php echo esc_html( 'Search' ) ?></label>
              <div class="inputs">
                <input type="search" id="input-text" placeholder="<?php echo esc_html( 'Enter text' ) ?>">
                <button><?php echo esc_html( 'Search' ) ?></button>
              </div>
            </form>
          </div>

        <?php endif; ?>

      </div>
    </div>

  </div>
</section>
