package Lingua::PTD::XzDmp;

use parent 'Lingua::PTD';
our $VERSION = '1.0';

use IO::Compress::Xz     qw(xz   $XzError);
use IO::Uncompress::UnXz qw(unxz $UnXzError);

=encoding UTF-8

=head1 NAME

Lingua::PTD::XzDmp - Sub-module to handle PTD xz files in Dumper Format

=head1 SYNOPSIS

  use Lingua::PTD;

  $ptd = Lingua::PTD->new( "file.dmp.xz" );

=head1 DESCRIPTION

Check L<<Lingua::PTD>> for complete reference.

=head1 SEE ALSO

NATools(3), perl(1)

=head1 AUTHOR

Alberto Manuel Brandão Simões, E<lt>ambs@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010-2012 by Alberto Manuel Brandão Simões

=cut

sub new {
    my ($class, $filename) = @_;
    my $self;
    unxz $filename => \$self or die "Failed to unxz: $UnXzError.";
    {
        no strict;
        $self = eval $self;
        die $@ if $@;
    }
    bless $self => $class #amen
}

sub _save {
    my ($self, $filename) = @_;

    my $z = new IO::Compress::Xz $filename or return 0;
    select $z;
    $self->dump;
    $z->close;

    return 1;
}

"This isn't right.  This isn't even wrong.";
__END__
