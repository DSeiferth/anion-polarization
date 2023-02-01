#!/usr/bin/perl -w

use strict;

# opens a generic .mdp file and replaces the values of
# 'pull_coord1_init ' with values at increments of 0.1
#pull_coord1_init

unless (@ARGV) {
    die "Usage: $0 input.mdp\n";
}

my $key = $ARGV[0];
my @temp = split('\.', $key);
my $base = $temp[0];

open(IN, "<$key");
my @in = <IN>;
close(IN);
my @vec = (0, 5, 10, 15, 20, 25, 30, 50, 55, 60);
# note we are specifying indices for states, not actual lambda values like in previous versions
#for (my $i=0; $i<25; $i++) { #$i=$i+0.1
for my $i (@vec){
    my $filename = "${base}_${i}.mdp";
    open(OUT, ">$filename");
    foreach $_ (@in) {
        unless ($_ =~ /^pull_coord1_init =/) {
            print OUT $_;
        }
        if ($_ =~ /^pull_coord1_init =/) {
            if ($i >= 0){
              printf OUT "%s %f \n", $&,  $i/100;
            }
        }
    }
    #$j=$j+0.1
    close(OUT);
}
exit;
