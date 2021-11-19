/**
 * @Author: Roni Laukkarinen
 * @Date:   2021-11-19 15:31:46
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-11-19 15:32:29
 */
// @source https://css-tricks.com/the-trick-to-viewport-units-on-mobile/
// First we get the viewport height and we multiple it by 1% to get a value for a vh unit
const vh = window.innerHeight * 0.01;
// Then we set the value in the --vh custom property to the root of the document
document.documentElement.style.setProperty('--vh', `${vh}px`);

// We listen to the resize event
window.addEventListener('resize', () => {
  // We execute the same script as before
  // eslint-disable-next-line no-shadow
  const vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty('--vh', `${vh}px`);
});
