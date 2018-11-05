#!/usr/bin/perl -w

@lines=<STDIN>;
foreach $line(@lines){
  # if($line=~ /.*([0-9]\.?[0-9]?)+.*/){
 @number=$line=~/(\-?\.?\d+(?:\.\d+)?)/g;
 my $lagest_number=(sort {$a<=>$b} @number)[-1];
 #print"@number\n";
 push @numbers, $lagest_number;
 push @LINES,$line;

}

if(@numbers){

  my $lagest_number = (sort {$a <=> $b} @numbers)[-1];
  #print"$lagest_number\n";
  foreach $i (0..$#number){
    print"$numbers[$i]\n";
    if ($numbers[$i] == $lagest_number){
    print"$LINES[$i]\n";
  }
  }
}
