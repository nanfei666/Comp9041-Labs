#!/usr/bin/perl -w
while($line=<STDIN>){
  my @line_number=$line=~ /(\-?\d+(?:\.\d+)?)/g;
  if(@line_number){
  my  $largest_number=(sort{$a<=>$b} @line_number)[-1];
    push @numbers,$largest_number;
    push @lines,$line;
  }
}
if(@numbers){
  my $largest_number_now=(sort{$a<=>$b}@numbers)[-1];
  foreach $i (0..$#numbers){
    if($numbers[$i]==$largest_number_now){
      print"$lines[$i]"
    }
  }
}
