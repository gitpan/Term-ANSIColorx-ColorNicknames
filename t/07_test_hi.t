use strict;
use warnings;

use Test;

plan tests => 2;

open FILE, "|$^X ./hi test1 sky test2 blood >TEST" or die $!;
print FILE "test: test1 test2\n";
close FILE;

open FILE, "TEST" or die $!;
my $contents = <FILE>;
close FILE;

ok( $contents =~ m/\e\[1;34mtest1\e\[0?m/ );
ok( $contents =~ m/\e\[31mtest2\e\[0?m/ );
