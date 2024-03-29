package Form::Factory::Control::Role::ScalarValue;
BEGIN {
  $Form::Factory::Control::Role::ScalarValue::VERSION = '0.020';
}
use Moose::Role;

excludes qw( 
    Form::Factory::Control::Role::BooleanValue
    Form::Factory::Control::Role::ListValue 
);

=head1 NAME

Form::Factory::Control::Role::ScalarValue - scalar valued controls

=head1 VERSION

version 0.020

=head1 DESCRIPTION

Implemented by single scalar valued controls

=head1 METHODS

=head2 default_isa

Scalar valued controls are "Str" by default.

=cut

use constant default_isa => 'Str';

=head1 AUTHOR

Andrew Sterling Hanenkamp C<< <hanenkamp@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Qubling Software LLC.

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;