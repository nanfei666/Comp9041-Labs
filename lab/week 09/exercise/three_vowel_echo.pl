#!/usr/bin/perl -w
my @input=@ARGV;
my @output=();
$new_line="";
foreach $line(@input){
  if($line=~ /([aeiouAEIOU]){3}/){
    $new_line=$new_line." ".$line;
    $new_line=~ s/^\s*//;
  }
}
print"$new_line\n";
#     if(@output eq ()){
#       push @output,$line;
#     }
#     else{
#       $first=shift @output;
#       $new_line=$first." ".$line;
#       push @output,$new_line;
#     }
#   }
# }
# foreach my $line(@output){
#   $line=~ s/^\s*//;
#   print"$line\n";
# }
