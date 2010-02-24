
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Form::Factory',
                       'DISTNAME' => 'Form-Factory',
                       'AUTHOR' => 'Andrew Sterling Hanenkamp <hanenkamp@cpan.org>',
                       'ABSTRACT' => 'A general-purpose form handling API',
                       'EXE_FILES' => [],
                       'VERSION' => '0.017',
                       'LICENSE' => 'perl',
                       'PREREQ_PM' => {
                                        'Test::Able::Runner' => '1.00',
                                        'Test::Able' => '0.09',
                                        'ExtUtils::MakeMaker' => '6.11',
                                        'List::MoreUtils' => '0.22',
                                        'Moose' => '0.93'
                                      }
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



