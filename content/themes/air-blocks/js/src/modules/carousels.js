/* eslint-disable no-param-reassign, no-unused-vars, import/no-unresolved */
/**
 * @Author: Roni Laukkarinen
 * @Date:   2022-05-07 12:03:42
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2022-05-24 11:48:34
 */
import Swiper, { Navigation } from 'swiper/core';

Swiper.use([Navigation]);

const initCarousels = () => {
  const Carousels = document.querySelectorAll('.swiper-container');
  const CarouselParams = {
    slidesPerView: 'auto',
    slideClass: 'swiper-slide',
    wrapperClass: 'swiper-wrapper',
    centeredSlides: false,
    spaceBetween: 40,
    speed: 200,
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
