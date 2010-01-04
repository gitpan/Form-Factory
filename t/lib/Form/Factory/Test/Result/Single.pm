package Form::Factory::Test::Result::Single;
our $VERSION = '0.013';


use Test::Able;

with qw( Form::Factory::Test::Result );

use Form::Factory::Result::Single;

has '+result_class' => (
    default   => 'Form::Factory::Result::Single',
);

1;
