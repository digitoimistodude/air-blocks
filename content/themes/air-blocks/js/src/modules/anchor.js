/* eslint-disable no-param-reassign, no-undef */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2022-05-07 12:20:13
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-12-05 18:54:44
 */
import MoveTo from 'moveto';

const initAnchor = () => {
  // General anchors used in links with class "js-trigger"
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

  const moveTo = new MoveTo(
    {
      ease: 'easeInQuad',
    },
    easeFunctions,
  );

  const triggers = document.getElementsByClassName('js-trigger');
  // eslint-disable-next-line no-plusplus
  for (let i = 0; i < triggers.length; i++) {
    moveTo.registerTrigger(triggers[i]);
  }
};

export default initAnchor;
