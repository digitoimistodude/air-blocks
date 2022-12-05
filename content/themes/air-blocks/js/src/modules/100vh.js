/* eslint-disable no-shadow */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2021-11-19 15:31:46
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-12-05 17:29:44
 */

const init100vh = () => {
  // 100vh fix
  // @source https://css-tricks.com/the-trick-to-viewport-units-on-mobile/
  // First we get the viewport height and we multiple it by 1% to get a value for a vh unit
  const vh = window.innerHeight * 0.01;
  // Then we set the value in the --vh custom property to the root of the document
  document.documentElement.style.setProperty('--vh', `${vh}px`);

  // We listen to the resize event
  window.addEventListener('resize', () => {
    // If we turn mobile phone from portrait to landscape or vice versa
    if (
      window.innerWidth > window.innerHeight
      || Math.abs(this.lastHeight - window.innerHeight) > 100
    ) {
      // We execute the same script as before
      const vh = window.innerHeight * 0.01;
      document.documentElement.style.setProperty('--vh', `${vh}px`);
    }
  });
};

export default init100vh;
