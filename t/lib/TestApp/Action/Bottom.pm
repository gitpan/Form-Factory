package TestApp::Action::Bottom;
our $VERSION = '0.005';


use Form::Factory::Processor;

extends qw( TestApp::Action::Middle );

has_control baz => (
    control    => 'text',
);

has_checker foo_must_not_have_lowercase_letters => sub {
    my $self = shift;
    if ($self->controls->{foo}->current_value =~ /\p{IsLower}/) {
        $self->error('Foo must not contain lowercase letters');
    }
};

sub run {
    my $self = shift;
    $self->success('Done.');
}

1;
