package Lingua::PTD::StarDict;

use warnings;
use strict;

use parent 'Lingua::PTD';
our $VERSION = '1.0';

use Lingua::StarDict::Gen;

=encoding UTF-8

=head1 NAME

Lingua::PTD::StarDict - Sub-module to export PTD to StarDict

=head1 SYNOPSIS

  use Lingua::PTD;

  my $ptd = Lingua::PTD->new( $file );
  $ptd->saveAs("stardict", $name, $options);

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
    my ($ptd, $name, $my_opts) = @_;
    my $min = $my_opts->{m} //= 0.2;
    my $dir = $my_opts->{d} //= './';

    my $d;
    $ptd->downtr( sub {
        my ($w, $c, %t) = @_;
        return if $w =~ m/^_/;

        my @l;
        foreach (keys %t) {
          push @l, sprintf "<kref>%s</kref> (%.0f%s)", $_, $t{$_}*100,'%' if ($t{$_} > $min);
        }
        $d->{$w} = join '; ', @l if @l;
      });
    Lingua::StarDict::Gen::writeDict($d, $name, $dir);

    return 1;
}

"This has been Sparta!";
__END__
