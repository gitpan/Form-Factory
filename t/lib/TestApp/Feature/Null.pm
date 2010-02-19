package TestApp::Feature::Null;
our $VERSION = '0.016';
use Moose;

with qw( Form::Factory::Feature );

package Form::Factory::Feature::Custom::Null;
our $VERSION = '0.016';
sub register_implementation { 'TestApp::Feature::Null' }

1;
