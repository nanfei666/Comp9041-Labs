#!/usr/bin/perl

open F,'<',$ARGV[1];
while ($line = <F>){
  chomp $line;
  push @array,$line;
}
if($#array+1<$ARGV[0]){

}
else{
  $number=$ARGV[0]-1;
  print("$array[$number]\n");
}
close F;
