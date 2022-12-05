/* eslint-disable max-len, no-param-reassign, no-unused-vars */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2021-11-18 15:12:35
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-12-05 18:48:49
 */

// Import modules (comment to disable)
import MoveTo from 'moveto';
import reframe from 'reframe.js';
import getLocalization from './modules/localization';
import { styleExternalLinks, getChildAltText, initExternalLinkLabels } from './modules/external-link';
import initAnchors from './modules/anchors';
import backToTop from './modules/top';
import initAirBlocksDemoFunctionality from './modules/air-blocks-demo';
import initCarousels from './modules/carousels';
import init100vh from './modules/100vh';
import initAccordions from './modules/accordion';
import './modules/navigation';

// Define Javascript is active by changing the body class
document.body.classList.remove('no-js');
document.body.classList.add('js');

document.addEventListener('DOMContentLoaded', () => {
  initAirBlocksDemoFunctionality();
  initCarousels();
  initAnchors();
  backToTop();
  styleExternalLinks();
  initExternalLinkLabels();
  getChildAltText();
  initAccordions();
  init100vh();

  // Fit video embeds to container
  reframe('.wp-has-aspect-ratio iframe');
});
