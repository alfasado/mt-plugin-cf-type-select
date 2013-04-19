package CFTypeSelect::Field;

use strict;

sub _override_customfield_types {
    my $plugin = MT->component( 'CFTypeSelect' );
    my $customfield_types = MT->registry( 'customfield_types' );
    my $select_field = $customfield_types->{ 'select' };
    my $delimiter = MT->config( 'CFDropDownDelimiter' );
    $select_field->{ 'options_delimiter' } = MT->config( 'CFDropDownDelimiter' );
    my $options_field = '<input type="text" name="options" value="<mt:var name="options" escape="html">" id="options" class="text" /><p class="hint">';
    $options_field .= $plugin->translate( "Please enter all allowable options for this field as a [_1] delimited list", $delimiter );
    $options_field .= '</p>';
    $select_field->{ 'options_field' } = $options_field;
    $customfield_types->{ 'select' } = $select_field;
}

1;