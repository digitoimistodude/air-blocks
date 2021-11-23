<?php
/**
 * Navigation layout.
 *
 * @Author: Roni Laukkarinen
 * @Date: 2020-05-11 13:22:26
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-23 17:19:56
 *
 * @package airblocks
 */

namespace Air_Light;

?>

<div class="main-navigation-wrapper" id="main-navigation-wrapper">

  <nav id="nav" class="nav-primary nav-menu" aria-label="<?php echo esc_html( get_default_localization( 'Main navigation' ) ); ?>">

    <ul class="menu-items">
      <li class="menu-item menu-item-blocks-count"><span>2</span> blocks available</li>
      <li class="menu-item menu-item-filter"><input id="filter-airblocks" type="search" autocomplete="off" placeholder="Filter blocks..."><span class="cursor" aria-hidden="true"></span></li>
      <li class="menu-item menu-item-button">
        <button id="toggle" class="toggle-outlines toggled" type="button">
          <span class="disabled"><?php include get_theme_file_path( '/svg/border-out.svg' ); ?></span>
          <span class="enabled"><?php include get_theme_file_path( '/svg/center-align.svg' ); ?></span>
          <span class="label screen-reader-text">Toggle outlines</span>
        </button>
      </li>
      <li style="display: none;" class="menu-item"><a href="https://github.com/digitoimistodude/air-light/wiki/Creating-your-own-Gutenberg-blocks-with-Air-light-and-Advanced-Custom-Fields">Getting started</a></li>
      <li class="menu-item social separator-left"><a href="https://www.linkedin.com/company/digitoimisto-dude-oy"><?php include get_theme_file_path( '/svg/linkedin.svg' ); ?><span class="screen-reader-text">LinkedIn</span></a></li>
      <li class="menu-item social"><a href="https://profiles.wordpress.org/digitoimistodude/"><?php include get_theme_file_path( '/svg/wordpress.svg' ); ?><span class="screen-reader-text">WordPress</span></a></li>
      <li class="menu-item social"><a href="https://www.facebook.com/digitoimistodude/"><?php include get_theme_file_path( '/svg/facebook.svg' ); ?><span class="screen-reader-text">Facebook</span></a></li>
      <li class="menu-item social"><a href="https://twitter.com/dudetoimisto"><?php include get_theme_file_path( '/svg/twitter.svg' ); ?><span class="screen-reader-text">Twitter</span></a></li>
      <li class="menu-item social"><a href="https://www.instagram.com/digitoimistodude/"><?php include get_theme_file_path( '/svg/instagram.svg' ); ?><span class="screen-reader-text">Instagram</span></a></li>
      <li class="menu-item social"><a href="https://github.com/digitoimistodude"><?php include get_theme_file_path( '/svg/github.svg' ); ?><span class="screen-reader-text">GitHub</span></a></li>
    </ul>

  </nav><!-- #nav -->
</div>
