<?php
/**
 * Navigation layout.
 *
 * @Author: Roni Laukkarinen
 * @Date: 2020-05-11 13:22:26
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-09-01 12:26:25
 *
 * @package dudeblocks
 */

namespace Air_Light;

?>

<div class="main-navigation-wrapper" id="main-navigation-wrapper">

  <!-- NB! Accessibility: Add/remove has-visible-label class for button if you want to enable/disable visible "Show menu/Hide menu" label for seeing users -->
  <button aria-controls="nav" id="nav-toggle" class="nav-toggle hamburger has-visible-label" type="button" aria-label="<?php echo esc_html( get_default_localization( 'Open main menu' ) ); ?>">
    <span class="hamburger-box">
      <span class="hamburger-inner"></span>
    </span>
    <span id="nav-toggle-label" class="nav-toggle-label"><?php echo esc_html( get_default_localization( 'Open main menu' ) ); ?></span>
  </button>

  <nav id="nav" class="nav-primary nav-menu" aria-label="<?php echo esc_html( get_default_localization( 'Main navigation' ) ); ?>">

    <?php wp_nav_menu( array(
      'theme_location' => 'primary',
      'container'      => false,
      'depth'          => 4,
      'menu_class'     => 'menu-items',
      'menu_id'        => 'main-menu',
      'echo'           => true,
      'fallback_cb'    => __NAMESPACE__ . '\Nav_Walker::fallback',
      'items_wrap'     => '<ul id="%1$s" class="%2$s">%3$s</ul>',
      'has_dropdown'   => true,
      'walker'         => new Nav_Walker(),
    ) ); ?>

  </nav><!-- #nav -->
</div>
