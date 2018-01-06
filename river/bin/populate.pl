#!/usr/bin/perl
#
# Upon install, populate the lists directory
#

use strict;
use warnings;

use UBOS::Utils;

if( 'install' eq $operation ) {
    my $dataDir     = $config->getResolve( 'appconfig.datadir' );
    my $listsDir    = "$dataDir/lists";
    my $listsSrcDir = '/usr/share/river/lists';

    if( UBOS::Utils::isDirEmpty( $listsDir ) && !UBOS::Utils::isDirEmpty( $listsSrcDir )) {
        UBOS::Utils::myexec( "cp -d -r -p --reflink=auto $listsSrcDir/* $listsDir/" );
    }
}

1;

