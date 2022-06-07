/* eslint-disable no-param-reassign, no-unused-vars, import/no-unresolved */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2022-05-07 12:03:42
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-06-07 16:52:13
 */
import Swiper, { Navigation, A11y } from 'swiper/core';
import getLocalization from './localization';

Swiper.use([Navigation, A11y]);

const initCarousels = () => {
  const Carousels = document.querySelectorAll('.swiper-container');
  const CarouselParams = {
    slidesPerView: 'auto',
    slideClass: 'swiper-slide',
    wrapperClass: 'swiper-wrapper',
    centeredSlides: false,
    spaceBetween: 40,
    speed: 200,
    autoHeight: false,
    updateOnImagesReady: true,
    lazyLoadingInPrevNext: true,
    a11y: {
      enabled: true,
      lastSlideMessage: getLocalization('last_slide'),
      prevSlideMessage: getLocalization('previous_slide'),
      nextSlideMessage: getLocalization('next_slide'),
      slideLabelMessage: null,
      slideRole: 'group',
    },
    navigation: {
      prevEl: '.swiper-button-prev',
      nextEl: '.swiper-button-next',
    },
  };

  Carousels.forEach((target) => {
    const swiper = new Swiper(target, CarouselParams);
  });
};

export default initCarousels;
