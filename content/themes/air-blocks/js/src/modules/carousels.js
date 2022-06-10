/* eslint-disable no-param-reassign, no-unused-vars, import/no-unresolved, no-plusplus */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2022-05-07 12:03:42
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-06-10 15:28:21
 */
import Swiper, {
  Navigation, Pagination, Scrollbar, A11y,
} from 'swiper/core';
import getLocalization from './localization';

Swiper.use([Navigation, Pagination, Scrollbar, A11y]);

const initCarousels = () => {
  // Init carousels
  const Carousels = document.querySelectorAll('.swiper-container');

  // Add skip links if not in admin
  if (!document.body.classList.contains('wp-admin')) {
    const allCarouselBlocks = document.querySelectorAll('.is-carousel');

    // Loop through all blocks
    for (let i = 0; i < allCarouselBlocks.length; i++) {
      // Get carousel block class nam (second, because first is 'block')
      if (typeof allCarouselBlocks[i].classList[1] !== 'undefined' || allCarouselBlocks[i].classList[1] !== null) {
        const carouselClass = allCarouselBlocks[i].classList[1];
        const carouselBlock = allCarouselBlocks[i];
        const nextBlock = carouselBlock.nextElementSibling;

        // Set ID to next block
        const nextBlockId = `anchor-${carouselClass}`;
        nextBlock.setAttribute('id', nextBlockId);

        // Skip link markup
        const skipLinkContent = `<a class="skip-link screen-reader-text js-trigger" href="#${nextBlockId}">${getLocalization('skip_slider')}</a>`;

        // Add skiplink right before container
        const skipLinkWrapper = document.createElement('div');
        skipLinkWrapper.classList.add('block');
        skipLinkWrapper.classList.add('block-reset-styles');
        skipLinkWrapper.classList.add('has-unified-padding-if-stacked');
        skipLinkWrapper.classList.add('is-skip-link');
        skipLinkWrapper.innerHTML = skipLinkContent;
        carouselBlock.parentNode.insertBefore(skipLinkWrapper, carouselBlock);
      }
    }
  }

  // Init swipers
  for (let i = 0; i < Carousels.length; i++) {
    Carousels[i].classList.add(`swiper-container-${i}`);
    Carousels[i].querySelector('.swiper-button-prev').classList.add(`swiper-button-prev-${i}`);
    Carousels[i].querySelector('.swiper-button-next').classList.add(`swiper-button-next-${i}`);

    if (Carousels[i].querySelector('.swiper-pagination')) {
      Carousels[i].querySelector('.swiper-pagination').classList.add(`swiper-pagination-${i}`);
    }

    if (Carousels[i].querySelector('.swiper-scrollbar')) {
      Carousels[i].querySelector('.swiper-scrollbar').classList.add(`swiper-scrollbar-${i}`);
    }

    const swiper = new Swiper(`.swiper-container-${i}`, {
      slidesPerView: 'auto',
      slideClass: 'swiper-slide',
      wrapperClass: 'swiper-wrapper',
      centeredSlides: false,
      spaceBetween: 40,
      speed: 200,
      autoHeight: false,
      updateOnImagesReady: true,
      lazyLoadingInPrevNext: true,

      on: {
        init() {
          const swiperElement = this.$el[0];
          const activeSlide = swiperElement.querySelectorAll('.swiper-slide-active')[0];
          const allSlides = swiperElement.querySelectorAll('.swiper-slide');

          // Hide all slides except active for screen readers
          allSlides.forEach((aSlide) => {
            aSlide.ariaHidden = 'true';
          });

          // Show active slide for screen readers
          activeSlide.ariaHidden = 'false';
        },
        slideChangeTransitionEnd() {
          // Run the same thing when slide changes
          const swiperElement = this.$el[0];
          const activeSlide = swiperElement.querySelectorAll('.swiper-slide-active')[0];
          const allSlides = swiperElement.querySelectorAll('.swiper-slide');

          // Hide all slides except active for screen readers
          allSlides.forEach((aSlide) => {
            aSlide.ariaHidden = 'true';
          });

          // Show active slide for screen readers
          activeSlide.ariaHidden = 'false';
        },
      },
      keyboard: {
        enabled: true,
      },
      a11y: {
        enabled: true,
        lastSlideMessage: getLocalization('last_slide'),
        prevSlideMessage: getLocalization('previous_slide'),
        nextSlideMessage: getLocalization('next_slide'),
        // If the next setting crashes the slider, the PR has not been merged yet: https://github.com/nolimits4web/swiper/issues/5782
        // Either comment it out for now or add manually to node_modules/swiper/modules/a11y/a11y.js
        // slideLabelMessage: null,
        slideRole: 'group',
      },
      navigation: {
        prevEl: `.swiper-button-prev-${i}`,
        nextEl: `.swiper-button-next-${i}`,
      },
      pagination: {
        el: `.swiper-pagination-${i}`,
        type: 'fraction',
      },
      scrollbar: {
        el: `.swiper-scrollbar-${i}`,
        draggable: true,
      },

    });
  }
};

export default initCarousels;
