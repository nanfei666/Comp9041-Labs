#!/usr/bin/perl -w
$filename = $ARGV[0];
open FILE,"<",$filename or die "can not open $filename";
while($line = <FILE>){
  $line = lc $line;
  $line=~ s/s?$//;
  $line=~ s/\s+/ /g;
  if($line=~ /\s+(\d+)\s+(.+)\s*$/){
    $number = $1;
    $species = $2;
    #print $1."\n";
    $number_pods{$species}++;#=$number_pods{$species}+1;
    $number_individuals{$species} = $number_individuals{$species}+$number;
  }
}
foreach $key (sort keys %number_pods){
  print "$key observations: $number_pods{$key} pods, $number_individuals{$key} individuals \n"
}
