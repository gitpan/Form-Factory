package Form::Factory::Interface::HTML::Widget::Select;
BEGIN {
  $Form::Factory::Interface::HTML::Widget::Select::VERSION = '0.020';
}
use Moose;

extends qw( Form::Factory::Interface::HTML::Widget::Element );

=head1 NAME

Form::Factory::Interface::HTML::Widget::Select - HTML interface widget helper

=head1 VERSION

version 0.020

=head1 DESCRIPTION

Move along. Nothing to see here.

=cut

has '+tag_name' => (
    default => 'select',
);

has name => (
    is        => 'ro',
    isa       => 'Str',
    required  => 1,
);

has size => (
    is        => 'ro',
    isa       => 'Int',
    predicate => 'has_size',
);

has multiple => (
    is        => 'ro',
    isa       => 'Bool',
);

has disabled => (
    is        => 'ro',
    isa       => 'Bool',
);

has tabindex => (
    is        => 'ro',
    isa       => 'Int',
    predicate => 'has_tabindex',
);

has available_choices => (
    is        => 'ro',
    isa       => 'ArrayRef[Form::Factory::Control::Choice]',
    required  => 1,
    default   => sub { [] },
);

has selected_choices => (
    is        => 'ro',
    isa       => 'ArrayRef',
    required  => 1,
    default   => sub { [] },
);

sub has_content { 1 }

override more_attributes => sub {
    my $self = shift;

    my %attributes = (
        name  => $self->name,
    );

    $attributes{size}     = $self->size     if $self->has_size;
    $attributes{multiple} = 'multiple'      if $self->multiple;
    $attributes{disabled} = 'disabled'      if $self->disabled;
    $attributes{tabindex} = $self->tabindex if $self->has_tabindex;

    return \%attributes;
};

override render_content => sub {
    my $self = shift;

    my %selected = map { $_ => 1 } @{ $self->selected_choices };

    my $content = '';
    for my $option (@{ $self->available_choices }) {
        $content .= '<option';
        $content .= ' value="' . $option->value . '"';
        $content .= ' selected="selected"' if $selected{ $option->value };
        $content .= '>' . $option->label . '</option>';
    }

    return super() . $content;
};

sub consume_control {
    my ($self, %options) = @_;
    my $params = $options{params};
    my $name   = $self->name;

    return { $name => $params->{ $name } };
}

=head1 AUTHOR

Andrew Sterling Hanenkamp C<< <hanenkamp@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Qubling Software LLC.

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=begin Pod::Coverage

  .*

=end Pod::Coverage

=cut

1;