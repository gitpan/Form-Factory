package TestApp::Control::Null;
our $VERSION = '0.011';


use Moose;

with qw( 
    Form::Factory::Control
    Form::Factory::Control::Role::ScalarValue
);

sub current_value { }

sub has_current_value { }

package Form::Factory::Control::Custom::Null;
our $VERSION = '0.011';


sub register_implementation { 'TestApp::Control::Null' }

1;
