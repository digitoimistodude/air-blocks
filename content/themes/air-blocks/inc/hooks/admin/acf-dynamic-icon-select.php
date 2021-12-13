<?php
/**
 * The template for acf-dynamic-icon-select
 *
 * Description of the file called
 * acf-dynamic-icon-select.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-13 16:02:45
 * @Last Modified by:   Tuomas Marttila
 * @Last Modified time: 2021-12-13 16:02:53
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */

namespace Air_Light;

/**
 * Make dynamic svg icon select to ACF select fields which name
 * contains "icon_svg".
 *
 * NOTE! This functions needs air-helper to work.
 */
function acf_dynamic_select_for_icon( $field ) {
  if ( ! function_exists( 'get_icons_for_user' ) ) {
    return $field;
  }

  if ( false === strpos( $field['name'], 'icon_svg' ) ) {
    return $field;
  }

  // add icons from "svg/foruser" directory.
  $field['choices'] = get_icons_for_user( [
    'show_preview' => $field['ui'],
    'icon_path'    => '/svg/foruser/',
    'show_empty'   => $field['allow_null'],
  ]);

  return $field;
}

// Improve styles of SVG icon field selector
function improved_acf_svg_selector_ui_styles() { ?>
  <script>
    acf.add_filter('select2_args', function( args, $select, settings, field, instance ) {

      const fieldname = settings.field.data.name;

      // Check if field name contains icon_svg, then apply custom classes
      if ( fieldname.indexOf('icon_svg') !== -1 ) {
        args.dropdownCssClass = 'svg-selector-ui-dropdown';
        args.selectionCssClass = 'svg-selector-ui-selection';
      }

      return args;
    });

    // prefix color select name with the color sample
    acf.add_filter('select2_args', function( args, $select, settings, field, instance ){
      const fieldname = settings.field.data.name;

      if ( fieldname.indexOf('color') !== -1 ) {
        args.templateResult = function( color ) {
          if ( ! color.id ) {
            return color.text;
          }

          return '<span style="display:inline-block;height:15px;width:15px;background-color:var(--color-' + color.id + ');margin-right: 5px;"></span>' + color.text;
        };
      }

      return args;
    });
  </script>

    <style type="text/css">
    /* Styles for default dynamic select elements for SVG icons */
    .acf-field[data-name="icon_svg_right"] .select2-selection .acf-selection,
    .acf-field[data-name="icon_svg_left"] .select2-selection .acf-selection,
    .acf-field[data-name="icon_svg"] .select2-selection .acf-selection {
      display: flex;
    }

    .acf-field[data-name="icon_svg_right"] .select2-selection,
    .acf-field[data-name="icon_svg_left"] .select2-selection,
    .acf-field[data-name="icon_svg"] .select2-selection {
      height: unset;
      padding: 10px;
    }

    .acf-field[data-name="icon_svg_right"] .select2-container .select2-selection--single .select2-selection__rendered,
    .acf-field[data-name="icon_svg_left"] .select2-container .select2-selection--single .select2-selection__rendered,
    .acf-field[data-name="icon_svg"] .select2-container .select2-selection--single .select2-selection__rendered {
      align-items: center;
      display: flex;
    }

    .acf-field[data-name="icon_svg_right"] .select2-container .select2-selection--single .select2-selection__rendered svg,
    .acf-field[data-name="icon_svg_left"] .select2-container .select2-selection--single .select2-selection__rendered svg,
    .acf-field[data-name="icon_svg"] .select2-container .select2-selection--single .select2-selection__rendered svg {
      max-height: 32px;
      margin-right: 10px;
      order: -1;
      padding: 5px;
      width: auto;
    }

    .acf-field[data-name="icon_svg_right"] .select2-results__option,
    .acf-field[data-name="icon_svg_left"] .select2-results__option,
    .acf-field[data-name="icon_svg"] .select2-results__option {
      align-items: center;
      display: flex;
    }

    .acf-field[data-name="icon_svg_right"] .select2-results__option svg,
    .acf-field[data-name="icon_svg_left"] .select2-results__option svg,
    .acf-field[data-name="icon_svg"] .select2-results__option svg {
      max-height: 32px;
      margin-right: 10px;
      order: -1;
      padding: 5px;
      width: auto;
    }

    .acf-field[data-name="icon_svg_right"] .select2-selection__clear,
    .acf-field[data-name="icon_svg_left"] .select2-selection__clear,
    .acf-field[data-name="icon_svg"] .select2-selection__clear {
      color: #999;
      display: flex;
      font-size: 15px;
      justify-content: flex-end;
      margin-right: 10px;
      order: 3;
    }

    .acf-field[data-name="icon_svg_right"] .select2-selection__clear:hover,
    .acf-field[data-name="icon_svg_left"] .select2-selection__clear:hover,
    .acf-field[data-name="icon_svg"] .select2-selection__clear:hover {
      color: #222;
    }

    .acf-field[data-name="icon_svg_right"] .select2-results__option,
    .acf-field[data-name="icon_svg_left"] .select2-results__option,
    .acf-field[data-name="icon_svg"] .select2-results__option {
      align-items: center;
      display: flex;
    }

    .select2-results__option svg {
      order: -1;
      padding: 0;
      margin-right: 10px;
      max-height: 32px;
      width: auto;
    }

    /* Better select2-dropdown UI styles */
    .select2-dropdown.svg-selector-ui-dropdown .select2-results__options {
      display: flex;
      flex-wrap: wrap;
      justify-content: flex-start;
      min-height: 64px;
      max-height: 500px;
    }

    .select2-dropdown.svg-selector-ui-dropdown .select2-results__options .select2-results__option {
      display: flex;
      visibility: hidden;
      min-width: 32px;
      max-width: 32px;
      max-height: 32px;
      min-height: 32px;
      height: 32px;
      margin: 4px;
      width: 32px;
    }

    .select2-container--default .select2-results__option--highlighted[aria-selected] {
      color: #fff;
      background-color: #1e1e1e;
    }

    .select2-dropdown.svg-selector-ui-dropdown .select2-results__options .select2-results__option:hover svg {
      background-color: #1e1e1e;
      border-radius: 5px;
    }

    .select2-dropdown.svg-selector-ui-dropdown .select2-results__options .select2-results__option:hover svg {
      color: #fff;
    }

    .select2-dropdown.svg-selector-ui-dropdown .select2-results__options .select2-results__option svg {
      visibility: visible;
      min-width: 32px;
      max-width: 32px;
      padding: 5px;
      width: 32px;
    }
  </style>
<?php }
