package Form::Factory::Factory;
our $VERSION = '0.001';


use Moose::Role;

use Form::Factory::Stasher::Memory;

requires qw( render_control consume_control );

=head1 NAME

Form::Factory::Factory - Interface for form factory implementations

=head1 VERSION

version 0.001

=head1 SYNOPSIS

  package Form::Factory::Factory::MyFactory;
our $VERSION = '0.001';


  use Moose;

  with qw( Form::Factory::Factory );

  sub render_control {
      my ($self, $control, %options) = @_;

      # Draw $control for user
  }

  sub consume_control {
      my ($self, $control, %options) = @_;

      # Consume values from user to fill $control
  }

=head1 DESCRIPTION

Defines the abstract interface for a form factory. 

=head1 ATTRIBUTES

=head2 stasher

A place for remembering things.

=cut

has stasher => (
    is        => 'ro',
    does      => 'Form::Factory::Stasher',
    required  => 1,
    default   => sub { Form::Factory::Stasher::Memory->new },
    handles   => [ qw( stash unstash ) ],
);

=head1 METHODS

=head2 stash

=head2 unstash

See L<Form::Factory::Stash>.

=head2 new_action

  my $action = $factory->new_action('Some::Action::Class', \%options);

Given the name of an action class, it initializes the class for use with this factory. The C<%options> are passed to the constructor.

=cut

sub new_action {
    my ($self, $class_name, $args) = @_;

    Class::MOP::load_class($class_name)
        or die "cannot load $class_name: $@";

    return $class_name->new( %$args, form_factory => $self );
}

=head2 new_control

  my $control = $factory->new_control($name, \%options);

Given the short name for a control and a hash reference of initialization arguments, return a fully initialized control.

=cut

sub new_control {
    my ($self, $name, $args) = @_;

    my $class_name = Form::Factory->control_class($name);
    return unless $class_name;

    return $class_name->new($args);
}

=head1 ROLE METHODS

The following methods need to implement the following methods.

=head2 render_control

  $factory->render_control($control, %options);

This method is used to render the control in the current form.

=head2 consume_control

  $factory->consume_control($control, %options);

This method is used to consume the values input for a current form.

=head1 CONTROLS

Here's a list of controls and the classes they represent:

=over

=item button

L<Form::Factory::Control::Button>

=item checkbox

L<Form::Factory::Control::Checkbox>

=item full_text

L<Form::Factory::Control::FullText>

=item password

L<Form::Factory::Control::Password>

=item select_many

L<Form::Factory::Control::SelectMany>

=item select_one

L<Form::Factory::Control::SelectOne>

=item text

L<Form::Factory::Control::Text>

=item value

L<Form::Factory::Control::Value>

=back

=head1 SEE ALSO

L<Form::Factory::Action>, L<Form::Factory::Control>, L<Form::Factory::Stasher>

=head1 AUTHOR

Andrew Sterling Hanenkamp, C<< <hanenkamp@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Qubling Software LLC.

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;