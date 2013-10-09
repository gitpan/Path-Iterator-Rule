
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.17;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Iterative, recursive file finder",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Path-Iterator-Rule",
  "EXE_FILES" => [],
  "LICENSE" => "apache",
  "NAME" => "Path::Iterator::Rule",
  "PREREQ_PM" => {
    "Carp" => 0,
    "File::Basename" => 0,
    "File::Spec" => 0,
    "List::Util" => 0,
    "Number::Compare" => "0.02",
    "Scalar::Util" => 0,
    "Text::Glob" => 0,
    "Try::Tiny" => 0,
    "re" => 0,
    "strict" => 0,
    "warnings" => 0,
    "warnings::register" => 0
  },
  "TEST_REQUIRES" => {
    "Exporter" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "File::Spec::Functions" => 0,
    "File::Temp" => 0,
    "File::pushd" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Path::Tiny" => 0,
    "Test::Deep" => 0,
    "Test::Filename" => "0.03",
    "Test::More" => "0.92",
    "lib" => 0
  },
  "VERSION" => "1.006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



