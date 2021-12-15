/* eslint-disable no-underscore-dangle, no-param-reassign, func-names, no-plusplus, no-unused-vars, camelcase, no-plusplus, max-len, consistent-return */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2021-11-18 15:12:35
 * @Last Modified by:   Tuomas Marttila
 * @Last Modified time: 2021-12-15 12:12:59
 */
/**
 * Air theme JavaScript.
 */

// Import modules (comment to disable)
import MoveTo from 'moveto';
import LazyLoad from 'vanilla-lazyload';
import reframe from 'reframe.js';
import getLocalization from './modules/localization';
import { styleExternalLinks, getChildAltText } from './modules/external-link';
import { setFigureWidths, setLazyLoadedFigureWidth } from './modules/gutenberg-helpers';
import 'what-input';

// Features
// import './modules/sticky-nav.js'
import slick from 'slick-carousel';

// Navigation
import './modules/navigation';

// 100vh for mobile
import './modules/100vh';

// Define Javascript is active by changing the body class
document.body.classList.remove('no-js');
document.body.classList.add('js');

// Fit video embeds to container
reframe('.wp-has-aspect-ratio iframe');

// Style external links
styleExternalLinks();

// Set non-lazyloaded figures width so captions in aligned images will be same width as image
const figures = document.querySelectorAll('figure');
setFigureWidths(figures);

// Filter blocks
const input = document.querySelector('#filter-airblocks');
const items = document.querySelector('.air-blocks-list').getElementsByTagName('section');
const counterItem = document.getElementById('block-count');

input.addEventListener('keyup', (ev) => {
  const text = ev.target.value;

  const pat = new RegExp(text, 'i');
  for (let i = 0; i < items.length; i++) {
    if (text === '') {
      // Count blocks
      counterItem.innerHTML = items.length;
    } else {
      // Count filtered blocks
      counterItem.innerHTML = i;
    }

    const item = items[i];
    if (pat.test(item.classList)) {
      item.classList.remove('hidden');
    } else {
      item.classList.add('hidden');
    }
  }
});

document.addEventListener('DOMContentLoaded', () => {
  // Count blocks
  counterItem.innerHTML = items.length;

  // Add block name tag to each block
  for (let i = 0; i < items.length; i++) {
    const item = items[i];
    const splitted = item.classList.value.split('-');
    const splittedblock = splitted[1].split('block');
    const getBlockName = splittedblock[0].split(' ');
    const blockname = getBlockName[0];

    const blockTagContent = `<p>${blockname}</p>`;
    const blockTag = document.createElement('div');
    blockTag.classList.add('block-name-tag');
    blockTag.innerHTML = blockTagContent;
    item.appendChild(blockTag, item.nextSibling);
  }
});

// Toggle button
document.querySelector('.toggle-outlines').addEventListener('click', (e) => {
  [].map.call(document.querySelectorAll('.toggle-outlines'), (el) => {
    el.classList.toggle('toggled');
  });

  [].map.call(document.querySelectorAll('.site'), (el) => {
    el.classList.toggle('has-decorations');
  });
});

// Init lazyload
// Usage example on template side when air-helper enabled:
// <?php vanilla_lazyload_tag( get_post_thumbnail_id( $post->ID ) ); ?>
// Refer to documentation:
// 1) https://github.com/digitoimistodude/air-helper#image-lazyloading-1
// 2) https://github.com/verlok/vanilla-lazyload#-getting-started---html
const airblocks_LazyLoad = new LazyLoad({
  callback_loaded: (el) => setLazyLoadedFigureWidth, // Set lazyloaded figure width so captions in aligned images will be same width as image
});

// After your content has changed...
airblocks_LazyLoad.update();

// jQuery start
(function ($) {
  // Accessibility: Ensure back to top is right color on right background
  // Note: Needs .has-light-bg or .has-dark-bg class on all blocks
  const stickyOffset = $('.back-to-top').offset();
  const $contentDivs = $('.block, .site-footer');
  $(document).scroll(() => {
    $contentDivs.each(function (k) {
      const _thisOffset = $(this).offset();
      const _actPosition = _thisOffset.top - $(window).scrollTop();
      if (
        _actPosition < stickyOffset.top
        && _actPosition + $(this).height() > 0
      ) {
        $('.back-to-top')
          .removeClass('has-light-bg has-dark-bg')
          .addClass(
            $(this).hasClass('has-light-bg') ? 'has-light-bg' : 'has-dark-bg',
          );
        return false;
      }
    });
  });

  // Detect Visible section on viewport from bottom
  // @link https://codepen.io/BoyWithSilverWings/pen/MJgQqR
  $.fn.isInViewport = function () {
    const elementTop = $(this).offset().top;
    const elementBottom = elementTop + $(this).outerHeight();

    const viewportTop = $(window).scrollTop();
    const viewportBottom = viewportTop + $(window).height();

    return elementBottom > viewportTop && elementTop < viewportBottom;
  };

  // Accessibility: Ensure back to top is right color on right background
  $(window).on('resize scroll', () => {
    $('.block, .site-footer').each(function () {
      if ($(this).isInViewport()) {
        $('.back-to-top')
          .removeClass('has-light-bg has-dark-bg')
          .addClass(
            $(this).hasClass('has-light-bg') ? 'has-light-bg' : 'has-dark-bg',
          );
      }
    });
  });

  // Hide or show the 'back to top' link
  $(window).scroll(function () {
    // Back to top
    const offset = 300; // Browser window scroll (in pixels) after which the 'back to top' link is shown
    const offset_opacity = 1200; // Browser window scroll (in pixels) after which the link opacity is reduced
    const scroll_top_duration = 700; // Duration of the top scrolling animation (in ms)
    const link_class = '.back-to-top';

    if ($(this).scrollTop() > offset) {
      $(link_class).addClass('is-visible');
    } else {
      $(link_class).removeClass('is-visible');
    }

    if ($(this).scrollTop() > offset_opacity) {
      $(link_class).addClass('fade-out');
    } else {
      $(link_class).removeClass('fade-out');
    }
  });

  // Document ready start
  $(() => {
    // Slick
    const slickSettings = {
      infinite: true,
      slidesToShow: 2,
      slidesToScroll: 1,
      arrows: true,
      dots: false,
      speed: 660,
      variableWidth: true,
      prevArrow: '<button class="slick-btn slick-prev"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 1000 1000"><path d="M733 990L243 500 733 10l23.9 23.9-466 466.1L757 966.1 733 990z"/></svg></button>',
      nextArrow: '<button class="slick-btn slick-next"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 1000 1000"><path d="M240.9 964.1l25.9 25.9 492.3-492.3-.4-.4L271.6 10 246 35.6l461.7 461.7-466.8 466.8z"/></svg></button>',
    };

    const imageCarousels = document.querySelectorAll('.slider');

    imageCarousels.forEach((slider) => {
      $(slider).slick({
        ...slickSettings,
        appendArrows: slider.parentNode.querySelector('.controls-buttons'),
      });
    });
  });
}(jQuery));

document.addEventListener('DOMContentLoaded', () => {
  const easeFunctions = {
    easeInQuad(t, b, c, d) {
      t /= d;
      return c * t * t + b;
    },
    easeOutQuad(t, b, c, d) {
      t /= d;
      return -c * t * (t - 2) + b;
    },
  };
  const moveTo = new MoveTo({
    ease: 'easeInQuad',
  },
  easeFunctions);
  const triggers = document.getElementsByClassName('js-trigger');
  for (let i = 0; i < triggers.length; i++) {
    moveTo.registerTrigger(triggers[i]);
  }
});

// Add aria-labels to links without text or aria-labels and contain image with alt text
const links = [...document.querySelectorAll('a')];
const linksWithImgChildren = links.forEach((link) => {
  // If link already has text content or an aria label no need to add aria-label
  if (link.textContent.trim() !== '' || link.ariaLabel) {
    return;
  }

  const ariaLabel = getChildAltText(link);
  if (ariaLabel !== '') {
    link.ariaLabel = ariaLabel;
  }
});
