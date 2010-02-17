package TestApp::Feature::Null;
our $VERSION = '0.015';
use Moose;

with qw( Form::Factory::Feature );

package Form::Factory::Feature::Custom::Null;
our $VERSION = '0.015';
sub register_implementation { 'TestApp::Feature::Null' }

1;
