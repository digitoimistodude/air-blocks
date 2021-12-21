/* eslint-disable no-underscore-dangle, no-param-reassign, func-names, no-plusplus, no-unused-vars, camelcase, no-plusplus, max-len, consistent-return */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2021-11-18 15:12:35
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-12-21 17:01:38
 */

// Import modules (comment to disable)
import MoveTo from 'moveto';
import LazyLoad from 'vanilla-lazyload';
import reframe from 'reframe.js';
import slick from 'slick-carousel';
import getLocalization from './modules/localization';
import { styleExternalLinks, getChildAltText } from './modules/external-link';
import { setFigureWidths, setLazyLoadedFigureWidth } from './modules/gutenberg-helpers';
import 'what-input';
import './modules/navigation';
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

/* Add one or more listeners to an element
** @param {DOMElement} element - DOM element to add listeners to
** @param {string} eventNames - space separated list of event names, e.g. 'click change'
** @param {Function} listener - function to attach for each event as a listener
*/
function addListenerMulti(element, eventNames, listener) {
  const events = eventNames.split(' ');
  for (let i = 0, iLen = events.length; i < iLen; i++) {
    element.addEventListener(events[i], listener, false);
  }
}

// Add block classes to an array
const blocks = Array.from(items, ({ classList }) => classList.value);

// Filter blocks
addListenerMulti(input, 'keyup click', (ev) => {
  const text = ev.target.value;

  const pat = new RegExp(text, 'i');
  for (let i = 0; i < items.length; i++) {
    const item = items[i];
    const splitted = item.classList.value.split('block-');
    const getBlockName = splitted[1].split(' ');
    const blockname = getBlockName[0];

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
    const splitted = item.classList.value.split('block-');
    const getBlockName = splitted[1].split(' ');
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

// Autocomplete
const suggestions = document.querySelector('.suggestions ul');

function search(str) {
  const results = [];
  const val = str.toLowerCase();

  for (let i = 0; i < blocks.length; i++) {
    if (blocks[i].toLowerCase().indexOf(val) > -1) {
      results.push(blocks[i].split('block-')[1].split(' ')[0]);
    }
  }

  return results;
}

function showSuggestions(results, inputVal) {
  suggestions.innerHTML = '';

  if (results.length > 0) {
    // Count filtered blocks
    counterItem.innerHTML = results.length;

    for (let i = 0; i < results.length; i++) {
      let item = results[i];

      if (item.indexOf(inputVal) > -1) {
        const match = item.match(new RegExp(inputVal, 'i'));
        item = item.replace(match[0], `<strong>${match[0]}</strong>`);
        suggestions.innerHTML += `<li>${item}</li>`;
      }
    }
    suggestions.classList.add('has-suggestions');
  } else {
    results = [];
    suggestions.innerHTML = '';
    suggestions.classList.remove('has-suggestions');
  }
}

function searchHandler(e) {
  const inputVal = e.currentTarget.value;
  let results = [];
  if (inputVal.length > 0) {
    results = search(inputVal);
  }
  showSuggestions(results, inputVal);
}

function useSuggestion(e) {
  input.value = e.target.innerText;
  input.focus();
  suggestions.innerHTML = '';
  suggestions.classList.remove('has-suggestions');
}

input.addEventListener('keyup', searchHandler);
suggestions.addEventListener('click', useSuggestion);

// Empty search when clicking cancel button on search input
input.addEventListener('search', (event) => {
  for (let i = 0; i < items.length; i++) {
    const item = items[i];

    // Reset
    item.classList.remove('hidden');
    suggestions.classList.remove('has-suggestions');
  }

  // Amount of block shown by default
  counterItem.innerHTML = items.length;
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
