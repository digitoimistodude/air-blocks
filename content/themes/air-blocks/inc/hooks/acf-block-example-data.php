<?php
/**
 * @Author: Roni Laukkarinen
 * @Date: 2021-08-24 16:00:52
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-12-21 16:49:37
 *
 * @package air-blocks
 */

namespace Air_Light;

/**
 * Build example data for ACF Block previews
 *
 * @param array $data Example data
 * @return array Modified example data
 */
function set_acf_blocks_example_data( $data ) {
  $text = 'Lorem ipsum dolor';
  $medium_text = 'Pellentesque tincidunt nulla nisi, eget vehicula turpis tincidunt ut. Fusce pharetra justo nulla, sed porttitor nunc varius faucibus.';
  $long_text = 'Pellentesque tincidunt nulla nisi, eget vehicula turpis tincidunt ut. Fusce pharetra justo nulla, sed porttitor nunc varius faucibus. Ut faucibus justo eu elementum dictum. Etiam non leo id nisl iaculis dapibus. In venenatis ipsum non lorem egestas ultrices.';
  $wysiwyg = '<p>Nam molestie nec tortor. <a href="#">Donec placerat</a> leo sit amet velit. Vestibulum id justo ut vitae massa. <strong>Proin in dolor mauris consequat aliquam.</strong> Donec ipsum, vestibulum ullamcorper venenatis augue. Aliquam tempus nisi in auctor vulputate, erat felis pellentesque augue nec, pellentesque lectus justo nec erat. Aliquam et nisl. Quisque sit amet dolor in justo pretium condimentum.</p>';
  $link = [
    'url' => '#',
    'title' => 'Lorem ipsum dolor',
  ];

  // Number here is equivalent of image ID, for example https://www.alpa.fi/wp/wp-admin/upload.php?item=22
  $default_img = 31;
  $url = wp_get_attachment_url( $default_img );

  $image = [
    'url' => $url,
  ];

  $image_column = [
    'image' => $default_img,
    'title' => $text,
    'content' => $medium_text,
    'link' => $link,
  ];

  $icon_column = [
    'icon_svg' => 'block.svg',
    'title' => $text,
    'content' => $medium_text,
    'link' => $link,
  ];

  return [
    'content-columns-50-50' => [
      'title_left' => $text,
      'title_right' => $text,
      'content_left' => $wysiwyg,
      'content_right' => $wysiwyg,
    ],
    'quote' => [
      'content' => $medium_text,
      'author' => $text,
    ],
    'form' => [
      'type' => 'default',
      'form' => 1,
    ],
    'cta' => [
      'background_color' => 'red',
      'title' => $text,
      'content' => $medium_text,
      'link' => $link,
    ],
    'title-content-columns' => [
      'title' => $text,
      'content' => $wysiwyg,
    ],
    'icon-content-columns' => [
      'columns' => [ $icon_column, $icon_column, $icon_column ],
    ],
    'image-content-columns' => [
      'columns' => [ $image_column, $image_column, $image_column ],
    ],
    'image-content' => [
      'title' => $text,
      'media_side' => 'left',
      'content' => $wysiwyg,
      'image' => $default_img,
      'link' => $link,
    ],
    'carousel' => [
      'images' => [ $image, $image, $image ],
    ],
  ];
}
