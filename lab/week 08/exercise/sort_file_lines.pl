#!/usr/bin/perl -w
$file_name = $ARGV[0];
open my $f,"<",$file_name;
@LINE=<$f>;
#print"@LINE\n";

close $f;
order_by_length(@LINE);
#print"@LINE\n";
@sorted_line = sort compare_length @LINE;
for $row(@sorted_line){
  print"$row";
}

sub order_by_length {
  foreach my $line(@_){
    $length = length $line;
    $all_line{$line}=$length;
    #print"$line $all_line{$line}\n";
  }
}
sub compare_length {
   if($all_line{$a}>$all_line{$b}){
     return 1;
   }
   if($all_line{$a}<$all_line{$b}){
     return -1;
   }
   if($all_line{$a}==$all_line{$b}){
    $a cmp $b;
   }
}
