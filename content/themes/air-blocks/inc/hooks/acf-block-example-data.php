<?php
/**
 * @Author: Roni Laukkarinen
 * @Date: 2021-08-24 16:00:52
 * @Last Modified by:   Tuomas Marttila
 * @Last Modified time: 2021-12-13 12:54:13
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
  $default_img = 92;

  $block_text = [
    'text_title' => $text,
    'text' => $wysiwyg,
  ];

  $downloadable_material = [
    'background_color' => 'red',
    'material_title' => $text,
    'description' => $medium_text,
    'download_location' => true,
    'link' => $link,
    'file_size' => '34kt',
  ];

  $box = [
    'icon_svg' => 'henkilot.svg',
    'title' => $text,
    'content' => $medium_text,
    'button' => $link,
  ];

  $image_box = [
    'image' => $default_img,
    'tag_badge' => 'Lorem',
    'title' => $text,
    'content' => $medium_text,
    'button' => $link,
  ];

  return [
    'text-list-cols' => [
      'content_type' => 'text',
      'text_left' => $block_text,
      'text_right' => $block_text,
    ],
    'citate' => [
      'citate' => $medium_text,
      'author' => $text,
    ],
    'form' => [
      'type' => 'default',
      'image' => $default_img,
      'form' => 1,
    ],
    'downloads' => [
      'title' => $text,
      'materials' => [ $downloadable_material, $downloadable_material, $downloadable_material ],
    ],
    'cta' => [
      'background_color' => 'red',
      'title' => $text,
      'content' => $medium_text,
      'link' => $link,
    ],
    'media-content-cols' => [
      'background_color' => 'red',
      'media_side' => 'left',
      'show_video' => false,
      'image' => $default_img,
      'title' => $text,
      'content' => $medium_text,
      'button' => $link,
    ],
    'title-content-columns' => [
      'title' => $text,
      'content' => $wysiwyg,
    ],
    'icon-content-cols' => [
      'background_color' => false,
      'boxes' => [ $box, $box, $box ],
    ],
    'image-content-cols' => [
      'boxes' => [ $image_box, $image_box, $image_box ],
    ],
  ];
}
