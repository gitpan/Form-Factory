package TestApp::Control::Null;
our $VERSION = '0.010';


use Moose;

with qw( 
    Form::Factory::Control
    Form::Factory::Control::Role::ScalarValue
);

sub current_value { }

package Form::Factory::Control::Custom::Null;
our $VERSION = '0.010';


sub register_implementation { 'TestApp::Control::Null' }

1;
