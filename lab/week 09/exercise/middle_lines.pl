#!/usr/bin/perl -w
$file=$ARGV[0];
open my $f,"<",$file or die;
while($line=<$f>){
  push @txt,$line;
}
close $f;
$number_line=$#txt;
#print"$number_line\n";
if(!@txt){

}
elsif($number_line % 2==0){
  my $middle_index=$number_line/2;
  print"$txt[$middle_index]";
  #print"$middle_index\n";

}
else{
  my $middle_index=($number_line-1)/2;
  my $next_index=$middle_index+1;
  print"$txt[$middle_index]";
  print"$txt[$next_index]";
}

# foreach $line(@txt){
#   print"$line";
# }
