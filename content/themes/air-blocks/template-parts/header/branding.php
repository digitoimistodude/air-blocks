<?php
/**
 * Branding
 *
 * Site branding.
 *
 * @Author:		Roni Laukkarinen
 * @Date:   		2021-11-18 15:12:34
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-18 21:02:45
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

$description = get_bloginfo( 'description', 'display' );
?>

<div class="site-branding">

  <p class="site-title">
    <a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
      <?php include get_theme_file_path( THEME_SETTINGS['logo'] ); ?>
      <span>blocks</span>
    </a>
  </p>

  <?php if ( $description || is_customize_preview() ) : ?>
    <p class="site-description screen-reader-text">
      <?php echo esc_html( $description ); ?>
    </p>
  <?php endif; ?>

</div>
