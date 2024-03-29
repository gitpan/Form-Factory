package Form::Factory::Control::Role::Labeled;
BEGIN {
  $Form::Factory::Control::Role::Labeled::VERSION = '0.020';
}
use Moose::Role;

=head1 NAME

Form::Factory::Control::Role::Labeled - labeled controls

=head1 VERSION

version 0.020

=head1 DESCRIPTION

Implemented by any control with a label.

=head1 ATTRIBUTES

=head2 label

The label. By default it is created from the control's name.

=cut

has label => (
    is        => 'ro',
    isa       => 'Str',
    required  => 1,
    builder   => '_build_label',
);

sub _build_label {
    my $self = shift;
    my $label = $self->name;
    $label =~ s/_/ /g;
    $label =~ s/\b(\w)/\U$1\E/g;
    return $label;
}

=head1 AUTHOR

Andrew Sterling Hanenkamp C<< <hanenkamp@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Qubling Software LLC.

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;