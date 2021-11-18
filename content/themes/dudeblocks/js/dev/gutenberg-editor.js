/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./content/themes/dudeblocks/node_modules/vanilla-lazyload/dist/lazyload.min.js":
/*!**************************************************************************************!*\
  !*** ./content/themes/dudeblocks/node_modules/vanilla-lazyload/dist/lazyload.min.js ***!
  \**************************************************************************************/
/***/ (function(module) {

eval("!function(t,n){ true?module.exports=n():0}(this,(function(){\"use strict\";function t(){return(t=Object.assign||function(t){for(var n=1;n<arguments.length;n++){var e=arguments[n];for(var i in e)Object.prototype.hasOwnProperty.call(e,i)&&(t[i]=e[i])}return t}).apply(this,arguments)}var n=\"undefined\"!=typeof window,e=n&&!(\"onscroll\"in window)||\"undefined\"!=typeof navigator&&/(gle|ing|ro)bot|crawl|spider/i.test(navigator.userAgent),i=n&&\"IntersectionObserver\"in window,o=n&&\"classList\"in document.createElement(\"p\"),r=n&&window.devicePixelRatio>1,a={elements_selector:\".lazy\",container:e||n?document:null,threshold:300,thresholds:null,data_src:\"src\",data_srcset:\"srcset\",data_sizes:\"sizes\",data_bg:\"bg\",data_bg_hidpi:\"bg-hidpi\",data_bg_multi:\"bg-multi\",data_bg_multi_hidpi:\"bg-multi-hidpi\",data_poster:\"poster\",class_applied:\"applied\",class_loading:\"loading\",class_loaded:\"loaded\",class_error:\"error\",class_entered:\"entered\",class_exited:\"exited\",unobserve_completed:!0,unobserve_entered:!1,cancel_on_exit:!0,callback_enter:null,callback_exit:null,callback_applied:null,callback_loading:null,callback_loaded:null,callback_error:null,callback_finish:null,callback_cancel:null,use_native:!1},c=function(n){return t({},a,n)},s=function(t,n){var e,i=\"LazyLoad::Initialized\",o=new t(n);try{e=new CustomEvent(i,{detail:{instance:o}})}catch(t){(e=document.createEvent(\"CustomEvent\")).initCustomEvent(i,!1,!1,{instance:o})}window.dispatchEvent(e)},l=\"loading\",u=\"loaded\",d=\"applied\",f=\"error\",_=\"native\",g=\"data-\",v=\"ll-status\",p=function(t,n){return t.getAttribute(g+n)},b=function(t){return p(t,v)},h=function(t,n){return function(t,n,e){var i=\"data-ll-status\";null!==e?t.setAttribute(i,e):t.removeAttribute(i)}(t,0,n)},m=function(t){return h(t,null)},E=function(t){return null===b(t)},y=function(t){return b(t)===_},A=[l,u,d,f],I=function(t,n,e,i){t&&(void 0===i?void 0===e?t(n):t(n,e):t(n,e,i))},L=function(t,n){o?t.classList.add(n):t.className+=(t.className?\" \":\"\")+n},w=function(t,n){o?t.classList.remove(n):t.className=t.className.replace(new RegExp(\"(^|\\\\s+)\"+n+\"(\\\\s+|$)\"),\" \").replace(/^\\s+/,\"\").replace(/\\s+$/,\"\")},k=function(t){return t.llTempImage},O=function(t,n){if(n){var e=n._observer;e&&e.unobserve(t)}},x=function(t,n){t&&(t.loadingCount+=n)},z=function(t,n){t&&(t.toLoadCount=n)},C=function(t){for(var n,e=[],i=0;n=t.children[i];i+=1)\"SOURCE\"===n.tagName&&e.push(n);return e},N=function(t,n,e){e&&t.setAttribute(n,e)},M=function(t,n){t.removeAttribute(n)},R=function(t){return!!t.llOriginalAttrs},G=function(t){if(!R(t)){var n={};n.src=t.getAttribute(\"src\"),n.srcset=t.getAttribute(\"srcset\"),n.sizes=t.getAttribute(\"sizes\"),t.llOriginalAttrs=n}},T=function(t){if(R(t)){var n=t.llOriginalAttrs;N(t,\"src\",n.src),N(t,\"srcset\",n.srcset),N(t,\"sizes\",n.sizes)}},j=function(t,n){N(t,\"sizes\",p(t,n.data_sizes)),N(t,\"srcset\",p(t,n.data_srcset)),N(t,\"src\",p(t,n.data_src))},D=function(t){M(t,\"src\"),M(t,\"srcset\"),M(t,\"sizes\")},F=function(t,n){var e=t.parentNode;e&&\"PICTURE\"===e.tagName&&C(e).forEach(n)},P={IMG:function(t,n){F(t,(function(t){G(t),j(t,n)})),G(t),j(t,n)},IFRAME:function(t,n){N(t,\"src\",p(t,n.data_src))},VIDEO:function(t,n){!function(t,e){C(t).forEach((function(t){N(t,\"src\",p(t,n.data_src))}))}(t),N(t,\"poster\",p(t,n.data_poster)),N(t,\"src\",p(t,n.data_src)),t.load()}},S=function(t,n){var e=P[t.tagName];e&&e(t,n)},V=function(t,n,e){x(e,1),L(t,n.class_loading),h(t,l),I(n.callback_loading,t,e)},U=[\"IMG\",\"IFRAME\",\"VIDEO\"],$=function(t,n){!n||function(t){return t.loadingCount>0}(n)||function(t){return t.toLoadCount>0}(n)||I(t.callback_finish,n)},q=function(t,n,e){t.addEventListener(n,e),t.llEvLisnrs[n]=e},H=function(t,n,e){t.removeEventListener(n,e)},B=function(t){return!!t.llEvLisnrs},J=function(t){if(B(t)){var n=t.llEvLisnrs;for(var e in n){var i=n[e];H(t,e,i)}delete t.llEvLisnrs}},K=function(t,n,e){!function(t){delete t.llTempImage}(t),x(e,-1),function(t){t&&(t.toLoadCount-=1)}(e),w(t,n.class_loading),n.unobserve_completed&&O(t,e)},Q=function(t,n,e){var i=k(t)||t;B(i)||function(t,n,e){B(t)||(t.llEvLisnrs={});var i=\"VIDEO\"===t.tagName?\"loadeddata\":\"load\";q(t,i,n),q(t,\"error\",e)}(i,(function(o){!function(t,n,e,i){var o=y(n);K(n,e,i),L(n,e.class_loaded),h(n,u),I(e.callback_loaded,n,i),o||$(e,i)}(0,t,n,e),J(i)}),(function(o){!function(t,n,e,i){var o=y(n);K(n,e,i),L(n,e.class_error),h(n,f),I(e.callback_error,n,i),o||$(e,i)}(0,t,n,e),J(i)}))},W=function(t,n,e){!function(t){t.llTempImage=document.createElement(\"IMG\")}(t),Q(t,n,e),function(t,n,e){var i=p(t,n.data_bg),o=p(t,n.data_bg_hidpi),a=r&&o?o:i;a&&(t.style.backgroundImage='url(\"'.concat(a,'\")'),k(t).setAttribute(\"src\",a),V(t,n,e))}(t,n,e),function(t,n,e){var i=p(t,n.data_bg_multi),o=p(t,n.data_bg_multi_hidpi),a=r&&o?o:i;a&&(t.style.backgroundImage=a,function(t,n,e){L(t,n.class_applied),h(t,d),n.unobserve_completed&&O(t,n),I(n.callback_applied,t,e)}(t,n,e))}(t,n,e)},X=function(t,n,e){!function(t){return U.indexOf(t.tagName)>-1}(t)?W(t,n,e):function(t,n,e){Q(t,n,e),S(t,n),V(t,n,e)}(t,n,e)},Y=[\"IMG\",\"IFRAME\"],Z=function(t){return t.use_native&&\"loading\"in HTMLImageElement.prototype},tt=function(t,n,e){t.forEach((function(t){return function(t){return t.isIntersecting||t.intersectionRatio>0}(t)?function(t,n,e,i){h(t,\"entered\"),L(t,e.class_entered),w(t,e.class_exited),function(t,n,e){n.unobserve_entered&&O(t,e)}(t,e,i),I(e.callback_enter,t,n,i),function(t){return A.indexOf(b(t))>=0}(t)||X(t,e,i)}(t.target,t,n,e):function(t,n,e,i){E(t)||(L(t,e.class_exited),function(t,n,e,i){e.cancel_on_exit&&function(t){return b(t)===l}(t)&&\"IMG\"===t.tagName&&(J(t),function(t){F(t,(function(t){D(t)})),D(t)}(t),function(t){F(t,(function(t){T(t)})),T(t)}(t),w(t,e.class_loading),x(i,-1),m(t),I(e.callback_cancel,t,n,i))}(t,n,e,i),I(e.callback_exit,t,n,i))}(t.target,t,n,e)}))},nt=function(t){return Array.prototype.slice.call(t)},et=function(t){return t.container.querySelectorAll(t.elements_selector)},it=function(t){return function(t){return b(t)===f}(t)},ot=function(t,n){return function(t){return nt(t).filter(E)}(t||et(n))},rt=function(t,e){var o=c(t);this._settings=o,this.loadingCount=0,function(t,n){i&&!Z(t)&&(n._observer=new IntersectionObserver((function(e){tt(e,t,n)}),function(t){return{root:t.container===document?null:t.container,rootMargin:t.thresholds||t.threshold+\"px\"}}(t)))}(o,this),function(t,e){n&&window.addEventListener(\"online\",(function(){!function(t,n){var e;(e=et(t),nt(e).filter(it)).forEach((function(n){w(n,t.class_error),m(n)})),n.update()}(t,e)}))}(o,this),this.update(e)};return rt.prototype={update:function(t){var n,o,r=this._settings,a=ot(t,r);z(this,a.length),!e&&i?Z(r)?function(t,n,e){t.forEach((function(t){-1!==Y.indexOf(t.tagName)&&(t.setAttribute(\"loading\",\"lazy\"),function(t,n,e){Q(t,n,e),S(t,n),h(t,_)}(t,n,e))})),z(e,0)}(a,r,this):(o=a,function(t){t.disconnect()}(n=this._observer),function(t,n){n.forEach((function(n){t.observe(n)}))}(n,o)):this.loadAll(a)},destroy:function(){this._observer&&this._observer.disconnect(),et(this._settings).forEach((function(t){delete t.llOriginalAttrs})),delete this._observer,delete this._settings,delete this.loadingCount,delete this.toLoadCount},loadAll:function(t){var n=this,e=this._settings;ot(t,e).forEach((function(t){O(t,n),X(t,e,n)}))}},rt.load=function(t,n){var e=c(n);X(t,e)},rt.resetStatus=function(t){m(t)},n&&function(t,n){if(n)if(n.length)for(var e,i=0;e=n[i];i+=1)s(t,e);else s(t,n)}(rt,window.lazyLoadOptions),rt}));\n\n\n//# sourceURL=webpack://dudeblocks/./content/themes/dudeblocks/node_modules/vanilla-lazyload/dist/lazyload.min.js?");

/***/ }),

/***/ "./content/themes/dudeblocks/js/src/gutenberg-editor.js":
/*!**************************************************************!*\
  !*** ./content/themes/dudeblocks/js/src/gutenberg-editor.js ***!
  \**************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var vanilla_lazyload__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vanilla-lazyload */ \"./content/themes/dudeblocks/node_modules/vanilla-lazyload/dist/lazyload.min.js\");\n/* harmony import */ var vanilla_lazyload__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(vanilla_lazyload__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _modules_gutenberg_helpers__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./modules/gutenberg-helpers */ \"./content/themes/dudeblocks/js/src/modules/gutenberg-helpers.js\");\n/* eslint-disable camelcase, prefer-arrow-callback, no-unused-vars, no-undef, vars-on-top, no-var, func-names, max-len, import/no-unresolved */\n\n // Declare the block you'd like to style.\n\nwp.blocks.registerBlockStyle('core/paragraph', {\n  name: 'boxed',\n  label: 'Laatikko'\n});\nvar dudeblocks_LazyLoad = new (vanilla_lazyload__WEBPACK_IMPORTED_MODULE_0___default())({\n  callback_loaded: _modules_gutenberg_helpers__WEBPACK_IMPORTED_MODULE_1__.setLazyLoadedFigureWidth\n}); // When document is ready as in when blocks are fully loaded\n\nwindow.addEventListener('load', function () {\n  /**\n   * initializeBlock\n   *\n   * Adds custom JavaScript to the block HTML.\n   *\n   * @date    15/4/19\n   * @since   1.0.0\n   *\n   * @param   object $block The block jQuery element.\n   * @param   object attributes The block attributes (only available when editing).\n   * @return  void\n   *\n   * @source https://www.advancedcustomfields.com/resources/acf_register_block_type/\n   */\n  var initializeBlock = function initializeBlock($block) {\n    dudeblocks_LazyLoad.update();\n  }; // Initialize each block on page load (front end).\n\n\n  dudeblocks_LazyLoad.update(); // Set non-lazyloaded figures width so captions in aligned images will be same width as image\n\n  var figures = document.querySelectorAll('figure');\n  (0,_modules_gutenberg_helpers__WEBPACK_IMPORTED_MODULE_1__.setFigureWidths)(figures); // Initialize dynamic block preview (editor).\n\n  if (window.acf) {\n    window.acf.addAction('render_block_preview', initializeBlock);\n  }\n});\n\n//# sourceURL=webpack://dudeblocks/./content/themes/dudeblocks/js/src/gutenberg-editor.js?");

/***/ }),

/***/ "./content/themes/dudeblocks/js/src/modules/gutenberg-helpers.js":
/*!***********************************************************************!*\
  !*** ./content/themes/dudeblocks/js/src/modules/gutenberg-helpers.js ***!
  \***********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"setFigureWidths\": () => (/* binding */ setFigureWidths),\n/* harmony export */   \"setLazyLoadedFigureWidth\": () => (/* binding */ setLazyLoadedFigureWidth)\n/* harmony export */ });\n/* harmony import */ var _babel_runtime_helpers_typeof__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @babel/runtime/helpers/typeof */ \"./content/themes/dudeblocks/node_modules/@babel/runtime/helpers/esm/typeof.js\");\n\n\nvar setFigureWidth = function setFigureWidth(figure) {\n  var img = figure.querySelector('img');\n\n  if (!img || (0,_babel_runtime_helpers_typeof__WEBPACK_IMPORTED_MODULE_0__[\"default\"])(img) !== 'object' || !('clientWidth' in img)) {\n    return;\n  }\n\n  figure.style.setProperty('--width-child-img', \"\".concat(img.clientWidth, \"px\"));\n};\n\nvar setFigureWidths = function setFigureWidths(figures) {\n  // Gutenberg magic for alignright and alignleft images\n  figures.forEach(function (figure) {\n    setFigureWidth(figure);\n  });\n};\n\nvar setLazyLoadedFigureWidth = function setLazyLoadedFigureWidth(image) {\n  if (image.parentElement.tagName === 'figure') {\n    setFigureWidth(image.parentElement);\n  }\n};\n\n\n\n//# sourceURL=webpack://dudeblocks/./content/themes/dudeblocks/js/src/modules/gutenberg-helpers.js?");

/***/ }),

/***/ "./content/themes/dudeblocks/node_modules/@babel/runtime/helpers/esm/typeof.js":
/*!*************************************************************************************!*\
  !*** ./content/themes/dudeblocks/node_modules/@babel/runtime/helpers/esm/typeof.js ***!
  \*************************************************************************************/
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ _typeof)\n/* harmony export */ });\nfunction _typeof(obj) {\n  \"@babel/helpers - typeof\";\n\n  if (typeof Symbol === \"function\" && typeof Symbol.iterator === \"symbol\") {\n    _typeof = function _typeof(obj) {\n      return typeof obj;\n    };\n  } else {\n    _typeof = function _typeof(obj) {\n      return obj && typeof Symbol === \"function\" && obj.constructor === Symbol && obj !== Symbol.prototype ? \"symbol\" : typeof obj;\n    };\n  }\n\n  return _typeof(obj);\n}\n\n//# sourceURL=webpack://dudeblocks/./content/themes/dudeblocks/node_modules/@babel/runtime/helpers/esm/typeof.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	(() => {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = (module) => {
/******/ 			var getter = module && module.__esModule ?
/******/ 				() => (module['default']) :
/******/ 				() => (module);
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./content/themes/dudeblocks/js/src/gutenberg-editor.js");
/******/ 	
/******/ })()
;