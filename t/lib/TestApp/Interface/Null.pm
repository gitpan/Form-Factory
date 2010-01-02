package TestApp::Interface::Null;
our $VERSION = '0.011';


use Moose;

with qw( Form::Factory::Interface );

sub render_control {}

sub consume_control {}

package Form::Factory::Interface::Custom::Null;
our $VERSION = '0.011';


sub register_implementation { 'TestApp::Interface::Null' }

1;
