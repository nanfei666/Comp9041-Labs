#!/usr/bin/perl -w
my @sorted_number = sort{$a<=>$b}@ARGV;
my $length = @sorted_number;
$index = ($length-1)/2;
print"$sorted_number[$index]\n";
