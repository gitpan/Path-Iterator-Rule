use 5.006;
use strict;
use warnings;
use Test::More 0.92;
use Path::Class;
use File::Temp;
use File::pushd qw/pushd/;

use lib 't/lib';
use PCNTest;

use PIR;

#--------------------------------------------------------------------------#

{
  my $td = make_tree(qw(
    empty/
    data/file1.txt
  ));

  my ($iter, @files);
  my $rule = PIR->new->file;

  $iter = $rule->iter($td);

  @files = ();
  while ( my $f = $iter->() ) {
    push @files, $f;
  }

  is( scalar @files, 1, "Iterator: one file") or diag explain \@files;
  is( ref $files[0], '', "Iterator: returns string, not object" );

  @files = ();
  @files = $rule->all($td);

  is( scalar @files, 1, "All: one file") or diag explain \@files;

  $rule = PIR->new->dir;
  @files = ();
  @files = map { "$_" } $rule->all($td);

  is( scalar @files, 3, "All: 3 directories") or diag explain \@files;

  my $wd = pushd($td);

  @files = ();
  @files = map { "$_" } $rule->all();
  is( scalar @files, 3, "All w/ cwd: 3 directories") or diag explain \@files;

  $rule->skip_dirs(qw/data/);
  @files = ();
  @files = map { "$_" } $rule->all();
  is( scalar @files, 2, "All w/ prune: 2 directories") or diag explain \@files;
}

done_testing;
#
# This file is part of Path-Iterator-Rule
#
# This software is Copyright (c) 2013 by David Golden.
#
# This is free software, licensed under:
#
#   The Apache License, Version 2.0, January 2004
#
