package TestApp::Feature::Control::Null;
our $VERSION = '0.015';
use Moose;

with qw( 
    Form::Factory::Feature
    Form::Factory::Feature::Role::Control
);

sub check_control { }

package Form::Factory::Feature::Control::Custom::Null;
our $VERSION = '0.015';
sub register_implementation { 'TestApp::Feature::Control::Null' }

1;
