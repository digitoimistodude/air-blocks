/**
 * @Author: Tuomas Marttila
 * @Date:   2021-11-25 13:56:22
 * @Last Modified by:   Tuomas Marttila
 * @Last Modified time: 2021-12-15 11:56:16
 */
/* eslint-disable camelcase, prefer-arrow-callback, no-unused-vars, no-undef, vars-on-top, no-var, func-names, max-len, import/no-unresolved */
import LazyLoad from 'vanilla-lazyload';
import slick from 'slick-carousel';
import { setFigureWidths, setLazyLoadedFigureWidth } from './modules/gutenberg-helpers';

// Declare the block you'd like to style.
wp.blocks.registerBlockStyle('core/paragraph', {
  name: 'boxed',
  label: 'Laatikko',
});

var airblocks_LazyLoad = new LazyLoad({
  callback_loaded: setLazyLoadedFigureWidth,
});

// Slick
const slickSettings = {
  infinite: true,
  slidesToShow: 2,
  slidesToScroll: 1,
  arrows: true,
  dots: false,
  speed: 660,
  variableWidth: true,
  prevArrow: '<button class="slick-btn slick-prev"><svg width="70" height="70" viewBox="0 0 70 70" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="35" cy="35" r="35" fill="white"/><path d="M38.647 48.353l-13-13 13-13" stroke="#000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/></svg></button>',
  nextArrow: '<button class="slick-btn slick-next"><svg width="70" height="70" viewBox="0 0 70 70" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="35" cy="35" r="35" fill="white"/><path d="M32.353 22.646l13 13-13 13" stroke="#000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/></svg></button>',
};

// When document is ready as in when blocks are fully loaded
window.addEventListener('load', function () {
  // Slick carousels
  // Must be in jQuery syntax and have timeout to work properly
  setTimeout(function () {
    if (jQuery('.slider') !== undefined) {
      jQuery('.slider').each(function () {
        jQuery(this).slick({
          ...slickSettings,
          appendArrows: jQuery(this).siblings('.controls-buttons'),
        });
      });
    }
  }, 2000);
  /**
   * initializeBlock
   *
   * Adds custom JavaScript to the block HTML.
   *
   * @date    15/4/19
   * @since   1.0.0
   *
   * @param   object $block The block jQuery element.
   * @param   object attributes The block attributes (only available when editing).
   * @return  void
   *
   * @source https://www.advancedcustomfields.com/resources/acf_register_block_type/
   */
  var initializeBlock = function ($block) {
    airblocks_LazyLoad.update();

    // Slick carousels
    // Must be in jQuery syntax and have timeout to work properly
    setTimeout(function () {
      if (jQuery('.slider') !== undefined) {
        jQuery('.slider').each(function () {
          jQuery(this).slick({
            ...slickSettings,
            appendArrows: jQuery(this).siblings('.controls-buttons'),
          });
        });
      }
    }, 2000);
  };

  // Initialize each block on page load (front end).
  airblocks_LazyLoad.update();

  // Set non-lazyloaded figures width so captions in aligned images will be same width as image
  const figures = document.querySelectorAll('figure');
  setFigureWidths(figures);

  // Initialize dynamic block preview (editor).
  if (window.acf) {
    window.acf.addAction('render_block_preview', initializeBlock);
  }
});
