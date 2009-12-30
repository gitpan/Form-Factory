
use strict;
use warnings;



use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Form-Factory',
  NAME      => 'Form::Factory',
  AUTHOR    => "Andrew\ Sterling\ Hanenkamp\ \<hanenkamp\@cpan\.org\>",
  ABSTRACT  => "A\ general\-purpose\ form\ handling\ API",
  VERSION   => '0.010',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::Able" => '0.09',
    "List::MoreUtils" => '0.22',
    "Moose" => '0.93',
  },
  test => {TESTS => 't/*.t'}
);

