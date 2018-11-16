#!/usr/bin/perl -w
use strict;

die "Usage: perl $0 <fastq.gz> <read_lenth>\n" if scalar @ARGV < 2;
my $fastq = @ARGV[0];
my $length_fastq = @ARGV[1];
my $num_reads = 0;

open(INPUT, '<', $fastq) or die "Could not open file '$fastq' $!";
while (<INPUT>) {
    chomp;
    my $line = split;
   if ($line =~ /^@\S+/) {
       $num_reads += 1;
       next;
   } 
    $line += $line
}
my $total_length = (length($line) - $num_reads)/2;
close INPUT;

open (OUTPUT, '>', $length_fastq);
print OUTPUT '$total_length';


