package Form::Factory::Control::FullText;
our $VERSION = '0.005';


use Moose;

with qw(
    Form::Factory::Control
    Form::Factory::Control::Role::Labeled
    Form::Factory::Control::Role::MultiLine
    Form::Factory::Control::Role::ScalarValue
);

=head1 NAME

Form::Factory::Control::FullText - The full_text control

=head1 VERSION

version 0.005

=head1 SYNOPSIS

  has_control message => (
      control => 'full_text',
      options => {
          default_value => q{Lots of
            text goes
            in here.},
      },
  );

=head1 DESCRIPTION

This is a multi-line text control.

=head1 ATTRIBUTES

=head2 value

The current value of the control.

=cut

has value => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_value',
);

=head2 default_value

The default value of the control.

=cut

has default_value => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_default_value',
);

=head2 stashable_keys

The L</value> is stashed.

=cut

has '+stashable_keys' => (
    default   => sub { [ qw( value ) ] },
);

=head1 METHODS

=head2 current_value

This use the L</value> if available. It falls back to L</default_value> otherwise. It returns an empty string if neither are set.

=cut

sub current_value {
    my $self = shift;
    $self->value(shift) if @_;
    return $self->has_value         ? $self->value
         : $self->has_default_value ? $self->default_value
         :                            '';
}

=head1 AUTHOR

Andrew Sterling Hanenkamp C<< <hanenkamp@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Qubling Software LLC.

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;