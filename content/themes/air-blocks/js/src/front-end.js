/* eslint-disable max-len, no-param-reassign, no-unused-vars */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2021-11-18 15:12:35
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-06-07 17:00:47
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
import 'what-input';
import './modules/navigation';
import './modules/100vh';
import './modules/accordion';

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

  // Fit video embeds to container
  reframe('.wp-has-aspect-ratio iframe');
});
