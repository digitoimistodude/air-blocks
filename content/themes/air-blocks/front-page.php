<?php
/**
 * The template for displaying front page
 *
 * Contains the closing of the #content div and all content after.
 * Initial styles for front page template.
 *
 * @Date:   2019-10-15 12:30:02
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-22 17:41:14
 *
 * @package airblocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

get_header(); ?>

<main class="site-main">

  <section class="block block-airblocks-filtering">
    <div class="container">
      <input id="filter-airblocks" type="text" autocomplete="off">
    </div>
  </section>

  <div class="air-blocks-list">
    <?php the_content(); ?>
  </div>

</main>

<?php get_footer();
