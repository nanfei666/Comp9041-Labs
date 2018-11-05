#!/usr/bin/perl -w
open my $f,'<',$ARGV[0];
while($line=<$f>){
  $line=~ s/[0-9]/#/g;
  #$line=~ s/^\s+//g;
  #print"$line";
  push @new,"$line";
  #join(" ",@new);
}

close $f;
open my $F,'>',$ARGV[0];
foreach $i(@new){
  print $F ("$i");
}
close $F;
