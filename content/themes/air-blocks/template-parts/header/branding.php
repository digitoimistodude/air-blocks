<?php
/**
 * Branding
 *
 * Site branding.
 *
 * @Author:		Roni Laukkarinen
 * @Date:   		2021-11-18 15:12:34
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-19 15:00:15
 *
 * @package airblocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

$description = get_bloginfo( 'description', 'display' );
?>

<div class="site-branding">

  <p class="site-title">
      <span class="label"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php include get_theme_file_path( '/svg/logo.svg' ); ?> Air Blocks</label></a> <span class="by">by</span> <a href="https://www.dude.fi"><span class="screen-reader-text">DUDE</span> <?php include get_theme_file_path( '/svg/logo-dude.svg' ); ?></a>
    </a>
  </p>

  <?php if ( $description || is_customize_preview() ) : ?>
    <p class="site-description screen-reader-text">
      <?php echo esc_html( $description ); ?>
    </p>
  <?php endif; ?>

</div>
