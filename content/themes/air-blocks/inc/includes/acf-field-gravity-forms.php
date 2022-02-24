<?php
/**
 * The template for acf-field-gravity-forms
 *
 * Description of the file called
 * acf-field-gravity-forms.
 *
 * @Author:		Tuomas Marttila
 * @Date:   		2021-12-15 08:44:19
 * @Last Modified by:   Roni Laukkarinen
 * @Last Modified time: 2021-12-15 08:45:21
 *
 * @package air-blocks
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 */
class ACF_Field_Gravity_Forms extends acf_field {

  public function __construct() {
    $this->name = 'gravity_forms_field';
    $this->label = 'Lomake';
    $this->category = 'Relationaalinen';
    $this->defaults = array(
      'multiple'    => 0,
      'allow_null'  => 0,
    );

    parent::__construct();
  }

  public function render_field( $field ) {
    $field = array_merge( $this->defaults, $field );
    $choices = [
      '0' => 'Ei lomaketta',
    ];

    $forms = RGFormsModel::get_forms( null, 'title' );

    if ( $forms ) {
      foreach ( $forms as $form ) {
        $choices[ $form->id ] = ucfirst( $form->title );
      }
    }

    // override field settings and render
    $field['choices'] = $choices;
    $field['type'] = 'select'; ?>
      <select name="<?php echo esc_attr( $field['name'] ); ?>" id="<?php echo esc_attr( $field['name'] ); ?>">
        <?php foreach ( $field['choices'] as $key => $value ) : ?>
          <option value="<?php echo esc_attr( $key ); ?>"<?php selected( $key, $field['value'] ); ?>><?php echo esc_html( $value ); ?></option>
        <?php endforeach; ?>
      </select>
    <?php
  }
}

new ACF_Field_Gravity_Forms();
