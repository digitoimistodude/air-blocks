<?php
/**
 * The template for form
 *
 * Description of the file called
 * form.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-15 08:41:59
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-12-15 08:58:03
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

if ( ! function_exists( 'gravity_form' ) ) {
  $is_preview && maybe_show_error_block( 'Gravity Forms ei ole aktivoitu' );
  return;
}

$type = get_field( 'type' );
$form = intval( get_field( 'form' ) );

if ( empty( $form ) ) {
  $is_preview && maybe_show_error_block( 'Aseta lomake' );
  return;
}

if ( 'manual' === $type ) {
  $title = get_field( 'title' );
  $content = get_field( 'content' );
} else {
  $forminfo = \GFAPI::get_form( $form );
  $title    = $forminfo['title'];
  $content  = $forminfo['description'];
} ?>

<section class="block block-form">
  <div class="container">
    <div class="col col-content">
      <?php if ( ! empty( $title ) ) : ?>
        <h2><?php echo esc_html( $title ); ?></h2>
      <?php endif; ?>

      <?php if ( ! empty( $content ) ) : ?>
        <?php echo wp_kses_post( wpautop( $content ) ); ?>
      <?php endif; ?>
    </div>

    <div class="col col-form">
      <?php gravity_form( $form, false, false, false, null, $ajax = true, 0, true ); ?>
    </div>
  </div>
</section>
