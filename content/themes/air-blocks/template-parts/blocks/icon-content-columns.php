<?php
/**
 * Icon and content columns
 *
 * A blog for content columns with icons.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-13 15:55:55
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2023-01-06 22:02:23
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

// Fields
$columns = get_field( 'columns' );

if ( empty( $columns ) ) {
  maybe_show_error_block( 'Lisää vähintään yksi palsta' );
  return;
}

?>

<section class="block block-icon-content-columns">
  <div class="container">
    <?php foreach ( $columns as $column ) : ?>
      <div class="col">

        <?php include get_theme_file_path( "svg/foruser/{$column['icon_svg']}" ); ?>

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

