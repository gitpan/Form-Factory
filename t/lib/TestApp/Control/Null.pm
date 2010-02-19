package TestApp::Control::Null;
our $VERSION = '0.016';
use Moose;

with qw( 
    Form::Factory::Control
    Form::Factory::Control::Role::ScalarValue
);

sub current_value { }

sub has_current_value { }

package Form::Factory::Control::Custom::Null;
our $VERSION = '0.016';
sub register_implementation { 'TestApp::Control::Null' }

1;
