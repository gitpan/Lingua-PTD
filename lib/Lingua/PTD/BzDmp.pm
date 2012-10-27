package Lingua::PTD::BzDmp;

use parent 'Lingua::PTD';
our $VERSION = '1.0';

use IO::Compress::Bzip2     qw(bzip2 $Bzip2Error);
use IO::Uncompress::Bunzip2 qw(bunzip2 $Bunzip2Error);

=encoding UTF-8

=head1 NAME

Lingua::PTD::BzDmp - Sub-module to handle PTD bzipped files in Dumper Format

=head1 SYNOPSIS

  use Lingua::PTD;

  $ptd = Lingua::PTD->new( "file.dmp.bz2" );

=head1 DESCRIPTION

Check L<<Lingua::PTD>> for complete reference.

=head1 SEE ALSO

NATools(3), perl(1)

=head1 AUTHOR

Alberto Manuel Brandão Simões, E<lt>ambs@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011-2012 by Alberto Manuel Brandão Simões

=cut

sub new {
    my ($class, $filename) = @_;
    my $self;
    bunzip2 $filename => \$self or die "Failed to bunzip: $Bunzip2Error.";
    {
        no strict;
        $self = eval $self;
        die $@ if $@;
    }
    bless $self => $class #amen
}

sub _save {
    my ($self, $filename) = @_;

    my $z = new IO::Compress::Bzip2 $filename or return 0;
    select $z;
    $self->dump;
    $z->close;

    return 1;
}

"This isn't right.  This isn't even wrong.";
__END__
