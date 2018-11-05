#!/usr/bin/perl -w

if ($#ARGV<0){
  print "Usage: ./identical_files.pl <files>";
}
@all_file=@ARGV;

@first=();
$first_file = shift @all_file;
open my $f,'<',$first_file;
# foreach my $line(<$f>){
#   push @first,$line;
# }
@first=<$f>;

close $f;
my $file=0;
while ($file<=$#all_file) {
  print $file;
  open my $e,'<',$all_file[$file];
  # foreach my $line($f){
  #   push @other,$line;
  # }
  @other=<$e>;
  close $e;
  print $#first."\n";
  print $#other."\n";

  if($#first != $#other){

    print"$all_file[$file] is not identical\n";
    exit(0);
  }
  else{
    for($i=0;$i<=$#first;$i++){
      print "$first[$i] , $other[$i] \n";
      if($first[$i] ne $other[$i]){
        print $file;
        print"$all_file[$file] is not identical\n";
          exit(0);

      }
    }
  }

$file++;
}
print"All files are identical\n";
