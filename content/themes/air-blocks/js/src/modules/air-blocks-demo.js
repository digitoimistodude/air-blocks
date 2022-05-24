/* eslint-disable no-plusplus, no-param-reassign, no-unused-vars */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2022-05-24 11:25:49
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-05-24 11:27:57
 */
const initAirBlocksDemoFunctionality = () => {
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
};

export default initAirBlocksDemoFunctionality;
