<?php
/**
 * The template for hero
 *
 * Description of the file called
 * hero.
 *
 * @Author:		Elias Kautto
 * @Date:   		2021-11-10 16:02:02
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-12 12:01:44
 *
 * @package dudeblocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

if ( ! isset( $args ) ) {
  $upper_title = get_field( 'upper_title' );
  $title = get_field( 'title' );
  $content = get_field( 'content' );
  $button = get_field( 'button' );
  $bg_image = get_post_thumbnail_id( get_the_ID() );
  if ( get_field( 'bg_image' ) ) {
    $bg_image = get_field( 'bg_image' );
  }
} else {
  $upper_title = $args['upper_title'];
  $title = $args['title'];
  $content = $args['content'];
  $button = $args['button'];
  $bg_image = $args['bg_image'];
}

$style = 'low';
if ( ! empty( get_field( 'style' ) ) ) {
  $style = get_field( 'style' );
}

if ( empty( $title ) ) {
  maybe_show_error_block( 'Otsikko on pakollinen' );
  return;
}
?>

<section class="block block-hero block-hero-<?php echo esc_attr( $style ) ?>">
<div class="shade" aria-hidden="true"></div>
 <div class="container">

  <?php vanilla_lazyload_div( $bg_image ); ?>

    <?php if ( is_front_page() ) : ?>
      <video src="<?php echo esc_url( get_template_directory_uri() ); ?>/demo.mp4" loop muted autoplay></video>
    <?php endif; ?>

    <div class="content">
      <div class="content-wrapper">

        <?php if ( function_exists( 'breadcrumb_trail' ) && empty( $upper_title ) ) {
          \breadcrumb_trail( [
            'show_browse' => false,
            'labels' => [
              'home' => ask__( 'Yleinen: Etusivu' ),
            ],
          ] );
        } elseif ( ! empty( $upper_title ) ) { ?>
          <p class="prefix">
            <?php echo esc_html( $upper_title ); ?>
          </p>
        <?php } ?>

        <h1 class="heading-hero" id="content">
          <?php echo esc_html( $title ); ?>
        </h1>

        <?php if ( ! empty( $content ) ) :
          echo wp_kses_post( wpautop( $content ) );
        endif;

        if ( ! empty( $button ) ) : ?>

         <p class="button-wrapper">
           <a class="button button-large<?php if ( str_contains( $button['url'], '#' ) ) echo ' js-trigger'; ?>" href="<?php echo esc_url( $button['url'] ); ?>">
              <?php echo esc_html( $button['title'] ); ?>
            </a>

            <?php if ( is_front_page() ) : ?>
              <button data-gallery="hero-video" class="open-video-fullscreen no-external-link-indicator play-video" type="button" data-video-url="https://player.vimeo.com/video/327180404?background=1&autoplay=1&loop=1&byline=0&title=0">
                <?php include get_theme_file_path( '/svg/play.svg' ); ?>
                <?php echo esc_html( ask__( 'Yleinen: Katso video' ) ); ?>
              </button>
            <?php endif; ?>
          </p>
        <?php endif; ?>
      </div>
    </div>

  </div>
</section>
