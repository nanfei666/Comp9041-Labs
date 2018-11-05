#!/usr/bin/perl -w

$species=$ARGV[0];
$filename = $ARGV[1];
$number_pods=0;
$number_individuals=0;
open FILE,"<",$filename or die "can not open $filename";
while($line=<FILE>){
  if($line =~ /(\d+)\s*$species$/){
    $number_pods=$number_pods+1;
    $number_individuals=$number_individuals+$1;
  }
}
print "$species observations: $number_pods pods, $number_individuals individuals \n"
