use 5.010;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Lingua::PTD',
    AUTHOR           => q{Alberto Simões <ambs@cpan.org>},
    VERSION_FROM     => 'lib/Lingua/PTD.pm',
    ABSTRACT_FROM    => 'lib/Lingua/PTD.pm',
    LICENSE          => 'Artistic_2_0',
    EXE_FILES        => ['scripts/nat-ptd'],
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
                       'Compress::Zlib'       => '1.16',
                       'Test::More' => 0,
    },
    PREREQ_PM => {
                  'DBD::SQLite'          => '1.30',
                  'Time::HiRes'          => '1.2',
                  'IO::Uncompress::Bunzip2' => '2.027',
                  'parent'               => '0',
                  'IO::Compress::Bzip2'  => '2.027',
                  'IO::Uncompress::UnXz' => '2.058',
                  'DBI'                  => '0',
                  'Pod::Usage'           => '0',
                  'Encode'               => '0',
                  'File::Spec'           => '0',
                  'File::Copy'           => '0',
                  'List::MoreUtils'      => '0',
                  'Term::ReadLine::Gnu'  => '1.20',
                  'Unicode::CaseFold'    => '0',
                  'IO::Compress::Xz'     => '2.058',
                 },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Lingua-PTD-*' },
);
