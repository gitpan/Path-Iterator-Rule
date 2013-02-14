use 5.010; # re::regexp_pattern
use strict;
use warnings;

package PIR;
# ABSTRACT: Short alias for Path::Iterator::Rule
our $VERSION = '0.012'; # VERSION

# Dependencies
use Path::Iterator::Rule;
our @ISA = qw/Path::Iterator::Rule/;

1;


# vim: ts=4 sts=4 sw=4 et:

__END__

=pod

=head1 NAME

PIR - Short alias for Path::Iterator::Rule

=head1 VERSION

version 0.012

=head1 SYNOPSIS

  use PIR;

  my $rule = PIR->new;          # match anything
  $rule->file->size(">10k");    # add/chain rules

  # iterator interface
  my $next = $rule->iter( @dirs );
  while ( my $file = $next->() ) {
    ...
  }

  # list interface
  for my $file ( $rule->all( @dirs ) ) {
    ...
  }

=head1 DESCRIPTION

This is an empty subclass of L<Path::Iterator::Rule>.  It saves you from having to type
the full name repeatedly, which is particularly handy for one-liners:

    $ perl -MPIR -wE 'say for PIR->new->skip_dirs(".")->perl_module->all(@INC)'

=for Pod::Coverage method_names_here

=head1 AUTHOR

David Golden <dagolden@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2013 by David Golden.

This is free software, licensed under:

  The Apache License, Version 2.0, January 2004

=cut
