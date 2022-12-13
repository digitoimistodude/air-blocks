/* eslint-disable max-len, no-param-reassign, no-unused-vars */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2021-11-18 15:12:35
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-12-13 14:41:27
 */

// Import modules (comment to disable)
import MoveTo from 'moveto';
import reframe from 'reframe.js';
import getLocalization from './modules/localization';
import { styleExternalLinks, getChildAltText, initExternalLinkLabels } from './modules/external-link';
import initAnchor from './modules/anchor';
import backToTop from './modules/top';
import initAirBlocksDemoFunctionality from './modules/air-blocks-demo';
import initCarousel from './modules/carousel';
import init100vh from './modules/100vh';
import initAccordion from './modules/accordion';
import './modules/navigation';

// Define Javascript is active by changing the body class
document.body.classList.remove('no-js');
document.body.classList.add('js');

document.addEventListener('DOMContentLoaded', () => {
  initAirBlocksDemoFunctionality();
  initCarousel();
  initAnchor();
  backToTop();
  styleExternalLinks();
  initExternalLinkLabels();
  getChildAltText();
  initAccordion();
  init100vh();

  // Fit video embeds to container
  reframe('.wp-has-aspect-ratio iframe');
});
