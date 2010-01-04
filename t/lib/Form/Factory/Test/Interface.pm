package Form::Factory::Test::Interface;
our $VERSION = '0.013';


use Test::Able::Role;
use Test::More;
use Test::Moose;

has name => (
    is        => 'ro',
    isa       => 'Str',
    required  => 1,
);

has class_name => (
    is        => 'ro',
    isa       => 'Str',
    required  => 1,
    lazy      => 1,
    default   => sub { 'Form::Factory::Interface::' . shift->name },
);

has interface_options => (
    is        => 'ro',
    does      => 'HashRef',
    required  => 1,
    lazy      => 1,
    default   => sub { {} },
);

has interface => (
    is        => 'ro',
    does      => 'Form::Factory::Interface',
    required  => 1,
    lazy      => 1,
    default   => sub { 
        my $self = shift;
        Form::Factory->new_interface($self->name, $self->interface_options);
    },
);

test plan => 4, interface_ok => sub { 
    my $self = shift;

    my $interface = $self->interface;
    ok($interface, "got a interface for " . $self->name);
    isa_ok($interface, $self->class_name);
    does_ok($interface, 'Form::Factory::Interface');
    can_ok($interface, qw( render_control consume_control ));
};

1;
