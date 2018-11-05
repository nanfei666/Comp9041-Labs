#!/usr/bin/perl -w
$file_in = "whales.txt";
$amount =0;
open FILE,"<",$file_in or die "can not open $file_in";
while ($line=<FILE>){
  if ($line =~ /\s*(\d+)\s*([a-zA-Z]+)$/) {
     $amount = $amount+$1;
}
}
print "$amount Orcas reported in $file_in";
