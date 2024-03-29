package Form::Factory::Interface::HTML::Widget::Textarea;
BEGIN {
  $Form::Factory::Interface::HTML::Widget::Textarea::VERSION = '0.020';
}
use Moose;

extends qw( Form::Factory::Interface::HTML::Widget::Element );

=head1 NAME

Form::Factory::Interface::HTML::Widget::Textarea - HTML interface widget helper

=head1 VERSION

version 0.020

=head1 DESCRIPTION

Move along. Nothing to see here.

=cut

has '+tag_name' => (
    default   => 'textarea',
);

has name => (
    is        => 'ro',
    isa       => 'Str',
    required  => 1,
);

has rows => (
    is        => 'ro',
    isa       => 'Int',
    predicate => 'has_rows',
);

has cols => (
    is        => 'ro',
    isa       => 'Int',
    predicate => 'has_cols',
);

sub has_content { 1 }

override more_attributes => sub {
    my $self = shift;

    my %attributes = (
        name => $self->name,
    );

    $attributes{rows} = $self->rows if $self->has_rows;
    $attributes{cols} = $self->cols if $self->has_cols;

    return \%attributes;
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