package Form::Factory::Test::Interface::HTML;
our $VERSION = '0.012';


use Test::Able;
use Test::More;

with qw( Form::Factory::Test::Interface );

has '+name' => (
    default => 'HTML',
);

1;
