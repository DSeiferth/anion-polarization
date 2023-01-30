#!/usr/bin/perl -w

use strict;

unless (@ARGV) {
    die "Usage: $0 input.mdp\n";
}

my $key = $ARGV[0];

my @temp = split('\.', $key);
my $base = $temp[0];

open(IN, "<$key");
my @in = <IN>;
close(IN);

for (my $i=-29; $i<30; $i++) {

    my $filename = "${base}_${i}.key";

    open(OUT, ">$filename");

    foreach $_ (@in) {
        if ($_ =~ /^RESTRAIN-PLANE X 7034/) {
            #if ($i >= 0){
              printf OUT "%s %f 2.0 0\n", $&, $i/2;
            #}
        }
        else {
            print OUT $_;
        }
    }
    close(OUT);

}


exit;
