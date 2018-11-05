#!/usr/bin/perl -w
$file=$ARGV[0];
open my $f,"<",$file;
while($line=<$f>){
  push @txt,$line;
}
$number_line=$#txt;
#print"$number_line\n";
if($number_line % 2==0){
  my $middle_index=$number_line/2;
  print"$txt[$middle_index]";
  #print"$middle_index\n";

}
if($number_line % 2 ==1){
  my $middle_index=($number_line-1)/2;
  my $next_index=$middle_index+1;
  print"$txt[$middle_index]";
  print"$txt[$next_index]";
}
if(@txt=0){
  exit 0 ;
}
# foreach $line(@txt){
#   print"$line";
# }
