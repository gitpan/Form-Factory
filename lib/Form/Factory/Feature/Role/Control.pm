package Form::Factory::Feature::Role::Control;
our $VERSION = '0.006';


use Moose::Role;

requires qw( check_control );

=head1 NAME

Form::Factory::Feature::Role::Control - Form features tied to particular controls

=head1 VERSION

version 0.006

=head1 SYNOPSIS

  package Form::Factory::Feature::Control::Color;
our $VERSION = '0.006';


  use Moose;

  with qw( 
      Form::Factory::Feature 
      Form::Factory::Feature::Role::Check
      Form::Factory::Feature::Role::Control 
      Form::Factory::Feature::Role::CustomControlMessage
  );

  has recognized_colors => (
      is        => 'ro',
      isa       => 'ArrayRef[Str]',
      required  => 1,
      default   => sub { [ qw( red orange yellow green blue purple black white ) ] },
  );

  sub check_control {
      my ($self, $control) = @_;

      die "color feature is only for scalar valued controls"
          unless $control->does('Form::Factory::Control::Role::ScalarValue');
  }

  sub check {
      my $self  = shift;
      my $value = $self->control->current_value;

      $self->control_error('the %s does not look like a color')
          unless grep { $value eq $_ } @{ $self->recognized_colors };
  }

And then used in an action via:

  package MyApp::Action::Foo;
our $VERSION = '0.006';


  use Form::Factory::Processor;

  has_control favorite_primary_color => (
      control  => 'select_one',
      options  => {
          available_choices => [
              map { Form::Factory::Control::Choice->new($_, ucfirst $_) }
                qw( red yellow blue )
          ],
      },
      features => {
          color => {
              recognized_colors => [ qw( red yellow blue ) ],
          },
      },
  );

=head1 DESCRIPTION

This role is required for any feature attached directly to a control using C<has_control>.

=head1 ATTRIBUTES

=head2 control

This is the control object the feature has been attached to.

=cut

has control => (
    is          => 'ro',
    does        => 'Form::Factory::Control',
    required    => 1,
    weak_ref    => 1,
    initializer => sub {
        my ($self, $value, $set, $attr) = @_;
        $self->check_control($value);
        $set->($value);
    },
);

=head1 AUTHOR

Andrew Sterling Hanenkamp C<< <hanenkamp@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Qubling Software LLC.

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;