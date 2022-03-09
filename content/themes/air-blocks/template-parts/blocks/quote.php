<?php
/**
 * Quote
 *
 * Block for all kinds of quotes.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-13 15:10:07
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-03-09 10:47:56
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

// Files (required):
// ├── sass/gutenberg/blocks/_quote.scss
// ├── svg/block-icons/quote.svg
// └── svg/quote.svg

namespace Air_Light;

$content = get_field( 'content' );
$author = get_field( 'author' );

if ( empty( $content ) ) {
  maybe_show_error_block( 'Lainaus on pakollinen' );
  return;
}

?>

<section class="block block-quote">
  <div class="container">

    <span class="icon">
      <?php include get_theme_file_path( '/svg/quote.svg' ); ?>
    </span>

    <p class="content">
      <?php echo esc_html( $content ) ?>
    </p>
    <?php if ( ! empty( $author ) ) : ?>
      <p class="author">
        <?php echo esc_html( $author ) ?>
      </p>
    <?php endif; ?>
  </div>
</section>

