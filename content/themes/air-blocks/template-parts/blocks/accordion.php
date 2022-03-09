<?php
/**
 * Accordion
 *
 * Block for accordion elements.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2022-01-07 11:12:46
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-03-09 10:45:11
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

$accordion_items = get_field( 'accordion_items' );

if ( empty( $accordion_items ) ) {
  maybe_show_error_block( 'Yhtään kohdetta ei ole lisätty' );
  return;
  }
    // Add these data attributes to accordion div if you want multiple:
    // data-allow-multiple

    // Add these data attributes accordion div if you want to enable toggling:
    // data-allow-toggle
?>

<section class="block block-accordion">
  <div class="container">
    <div class="accordion" data-allow-toggle>
      <?php foreach ( $accordion_items as $accordion_item ) : ?>
        <?php $key = sanitize_title( $accordion_item['title'] ); ?>
        <div class="accordion-item">
        <h3>
          <button
            aria-expanded="false"
            class="accordion-trigger"
            aria-controls="<?php echo esc_attr( $key ); ?>"
            id="accordion-<?php echo esc_attr( $key ); ?>">
              <span class="accordion-title">
                <?php echo esc_html( $accordion_item['title'] ) ?><span class="accordion-icon"></span>
              </span>
          </button>
        </h3>

        <div
          id="<?php echo esc_attr( $key ); ?>"
          role="region"
          aria-labelledby="accordion-<?php echo esc_attr( $key ); ?>"
          class="accordion-panel"
          hidden="">
            <div>
              <?php echo wp_kses_post( wpautop( $accordion_item['content'] ) ); ?>
            </div>
        </div>
        </div>

        <?php endforeach ?>
    </div>
  </div>
</section>
