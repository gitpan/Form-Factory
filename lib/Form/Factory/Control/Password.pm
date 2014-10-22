package Form::Factory::Control::Password;
our $VERSION = '0.001';


use Moose;

with qw( 
    Form::Factory::Control 
    Form::Factory::Control::Role::Labeled
    Form::Factory::Control::Role::ScalarValue
);

=head1 NAME

Form::Factory::Control::Password - the password control

=head1 VERSION

version 0.001

=head1 SYNOPSIS

  has_control new_password => (
      control => 'password',
  );

head1 DESCRIPTION

This is a password control. It is similar to a text control, but does not stash anything and has no default value.

=head1 ATTRIBUTES

=head2 value

This is the current value of the password control.

=cut

has value => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_value',
);

=head1 METHODS

=head2 current_value

This returns L</value> if set or an empty string.

=cut

sub current_value {
    my $self = shift;
    $self->value(shift) if @_;
    return $self->has_value ? $self->value
         :                    '';
}

=head1 AUTHOR

Andrew Sterling Hanenkamp C<< <hanenkamp@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Qubling Software LLC.

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;