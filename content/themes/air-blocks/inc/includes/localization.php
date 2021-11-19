<?php
/**
 * @Author: Timi Wahalahti
 * @Date:   2019-12-03 11:03:31
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-09-02 10:43:53
 *
 * @package air-blocks
 */

namespace Air_Light;

add_filter( 'air_helper_pll_register_strings', function() {
  $strings = [
    // 'Key: String' => 'String',
  ];

  /**
   * Uncomment if you need to have default air-blocks accessibility strings
   * translatable via Polylang string translations.
   */
  // foreach ( get_default_localization_strings() as $key => $value ) {
  // $strings[ "Accessibility: {$key}" ] = $value;
  // }

  return $strings;
} );

function get_default_localization_strings( $language = 'en' ) {
  $strings = [
    'en'  => [
      'Add a menu'                                   => __( 'Add a menu', 'air-blocks' ),
      'Open main menu'                               => __( 'Open main menu', 'air-blocks' ),
      'Close main menu'                              => __( 'Close main menu', 'air-blocks' ),
      'Main navigation'                              => __( 'Main navigation', 'air-blocks' ),
      'Back to top'                                  => __( 'Back to top', 'air-blocks' ),
      'Open child menu'                              => __( 'Open child menu', 'air-blocks' ),
      'Open child menu for'                          => __( 'Open child menu for', 'air-blocks' ),
      'Close child menu'                             => __( 'Close child menu', 'air-blocks' ),
      'Close child menu for'                         => __( 'Close child menu for', 'air-blocks' ),
      'Skip to content'                              => __( 'Skip to content', 'air-blocks' ),
      'External site'                                => __( 'External site', 'air-blocks' ),
      'opens in a new window'                        => __( 'opens in a new window', 'air-blocks' ),
      'Page not found.'                              => __( 'Page not found.', 'air-blocks' ),
      'The reason might be mistyped or expired URL.' => __( 'The reason might be mistyped or expired URL.', 'air-blocks' ),
      'Search'                                       => __( 'Search', 'air-blocks' ),
      'Block missing required data'                  => __( 'Block missing required data', 'air-blocks' ),
      'This error is shown only for logged in users' => __( 'This error is shown only for logged in users', 'air-blocks' ),
      'No results found for your search'                   => __( 'No results found for your search', 'air-blocks' ),
    ],
    'fi'  => [
      'Add a menu'                                   => 'Luo uusi valikko',
      'Open main menu'                               => 'Avaa päävalikko',
      'Close main menu'                              => 'Sulje päävalikko',
      'Main navigation'                              => 'Päävalikko',
      'Back to top'                                  => 'Takaisin ylös',
      'Open child menu'                              => 'Avaa alavalikko',
      'Open child menu for'                          => 'Avaa alavalikko kohteelle',
      'Close child menu'                             => 'Sulje alavalikko',
      'Close child menu for'                         => 'Sulje alavalikko kohteelle',
      'Skip to content'                              => 'Siirry suoraan sisältöön',
      'External site'                                => 'Ulkoinen sivusto',
      'opens in a new window'                        => 'avautuu uuteen ikkunaan',
      'Page not found.'                              => 'Hups. Näyttää, ettei sivua löydy.',
      'The reason might be mistyped or expired URL.' => 'Syynä voi olla virheellisesti kirjoitettu tai vanhentunut linkki.',
      'Search'                                       => 'Haku',
      'Block missing required data'                  => 'Lohkon pakollisia tietoja puuttuu',
      'This error is shown only for logged in users' => 'Tämä virhe näytetään vain kirjautuneille käyttäjille',
      'No results for your search'                   => 'Haullasi ei löytynyt tuloksia',
    ],
  ];

  return ( array_key_exists( $language, $strings ) ) ? $strings[ $language ] : $strings['en'];
} // end get_default_localization_strings

function get_default_localization( $string ) {
  if ( function_exists( 'ask__' ) && array_key_exists( "Accessibility: {$string}", apply_filters( 'air_helper_pll_register_strings', [] ) ) ) {
    return ask__( "Accessibility: {$string}" );
  }

  return esc_html( get_default_localization_translation( $string ) );
} // end get_default_localization

function get_default_localization_translation( $string ) {
  $language = get_bloginfo( 'language' );
  if ( function_exists( 'pll_the_languages' ) ) {
    $language = pll_current_language();
  }

  $translations = get_default_localization_strings( $language );

  return ( array_key_exists( $string, $translations ) ) ? $translations[ $string ] : '';
} // end get_default_localization_translation
