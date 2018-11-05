#!/usr/bin/perl -w

foreach my $input(@ARGV){
  if (exists ($count{$input})){
    next;
  }
  else{
    $count{$input}=1;
    push @uniqu_value,$input;
  }
}
foreach my $input(@uniqu_value){
  print"$input ";
}
print"\n";
