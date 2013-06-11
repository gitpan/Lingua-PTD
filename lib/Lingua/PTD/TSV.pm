package Lingua::PTD::TSV;

use warnings;
use strict;

use parent 'Lingua::PTD';
our $VERSION = '1.0';

=encoding UTF-8

=head1 NAME

Lingua::PTD::TSV - Sub-module to export PTD to TSV

=head1 SYNOPSIS

  use Lingua::PTD;

  $ptd = Lingua::PTD->new( "file.tsv" );

=head1 DESCRIPTION

Check L<<Lingua::PTD>> for complete reference.

=head1 SEE ALSO

NATools(3), perl(1)

=head1 AUTHOR

Alberto Manuel Brandão Simões, E<lt>ambs@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010-2012 by Alberto Manuel Brandão Simões

=cut

sub _save {
    my ($ptd, $filename, $min) = @_;

    open OUT, ">:utf8", $filename or return 0;
    select OUT;
    $ptd->downtr( sub {
        my ($w, $c, %t) = @_;
        foreach (keys %t) {
          printf("%s\t%s\t%s %.0f%s\n",$w,$_,$_,$t{$_}*100,'%') if ($t{$_} > $min);
        }
      });
    close OUT;

    return 1;
}

"This is Sparta!";
__END__
