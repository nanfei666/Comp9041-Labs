#!/usr/bin/perl -w
while($line=<STDIN>){
  @array = split /\s+/,$line;
  @sorted = sort @array;
  print join(" ",@sorted),"\n";
}
