
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Iterative, recursive file finder",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Config" => 0,
    "Exporter" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "File::pushd" => 0,
    "Path::Class" => 0,
    "Test::Deep" => 0,
    "Test::More" => "0.92",
    "autodie" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Path-Iterator-Rule",
  "EXE_FILES" => [],
  "LICENSE" => "apache",
  "NAME" => "Path::Iterator::Rule",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Clone" => 0,
    "File::Basename" => 0,
    "IO::Dir" => 0,
    "List::Util" => 0,
    "Number::Compare" => "0.02",
    "Scalar::Util" => 0,
    "Text::Glob" => 0,
    "Try::Tiny" => 0,
    "namespace::clean" => 0,
    "re" => 0,
    "strict" => 0,
    "warnings" => 0,
    "warnings::register" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



