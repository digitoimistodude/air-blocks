<?php
/**
 * Image and content columns
 *
 * A column that shows an image and content.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-14 11:00:36
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-08-30 15:54:42
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

// Files (required):
// ├── sass/gutenberg/blocks/_image-content-columns.scss
// └── svg/block-icons/image-content-columns.svg

namespace Air_Light;

$columns = get_field( 'columns' );

if ( empty( $columns ) ) {
  maybe_show_error_block( 'Lisää vähintään yksi palsta' );
  return;
}

?>

<section class="block block-image-content-columns">
  <div class="container">
    <?php foreach ( $columns as $column ) : ?>
      <div class="col">

        <?php if ( ! empty( $column['image'] ) ) : ?>
          <div class="image image-background">
            <?php native_lazyload_tag( $column['image'] ) ?>
          </div>
        <?php endif; ?>

        <div class="content-wrapper">

          <?php if ( ! empty( $column['title'] ) ) : ?>
            <h2>
              <?php echo esc_html( $column['title'] ); ?>
            </h2>
          <?php endif; ?>

          <?php if ( ! empty( $column['content'] ) ) : ?>
            <?php echo wp_kses_post( wpautop( $column['content'] ) ); ?>
          <?php endif; ?>

          <?php if ( ! empty( $column['link'] ) ) : ?>
            <p class="button-wrapper">
              <a href="<?php echo esc_url( $column['link']['url'] ) ?>" class="button"><?php echo esc_html( $column['link']['title'] ); ?></a>
            </p>
          <?php endif; ?>

        </div>
      </div>
    <?php endforeach; ?>
  </div>
</section>

