#!/usr/bin/perl -w

use File::Copy;
$first_backup_file = ".$ARGV[0].0";
sub maxNumber {
  my $max_number=shift @_;
  foreach(@_){
    if($_>$max_number){
      $max_number=$_;
    }
  }
  return $max_number;
}

@all_back_up_file= glob(".$ARGV[0].[0-9]*");
# $ini_backup_file =~ /\.$ARGV[0]\.(.*)/;
# print($1);
if(@all_back_up_file){
  for $back_up_file(@all_back_up_file){
    $back_up_file=~ /.$ARGV[0].([0-9]*)/;
    push @number,$1;
  }
  my $Max = maxNumber(@number);
  $latest=$Max+1;
  $latest_backup_file=".$ARGV[0].$latest";
  copy $ARGV[0],$latest_backup_file;
  print"Backup of 'n.txt' saved as '$latest_backup_file'\n";
}
else{
  copy $ARGV[0],$first_backup_file;
  print"Backup of 'n.txt' saved as '.n.txt.0'\n";
}
