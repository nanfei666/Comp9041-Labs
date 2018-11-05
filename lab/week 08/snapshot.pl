#!/usr/bin/perl -w

use File::Copy;
sub maxNumber {
  my $max_number=shift @_;
  foreach(@_){
    if($_>$max_number){
      $max_number=$_;
    }
  }
  return $max_number;
}

sub save_file {
  my @all_file = glob ("*");
  foreach my $file(@all_file){
    if($file ne $0){
      push @file_excep_pl,$file;
    }
  }
  my @all_sub_dir = glob(".snapshot.*");
  if(@all_sub_dir){
    foreach my $sub_dir (@all_sub_dir) {
      $sub_dir=~ /.snapshot.([0-9]*)/;
      push @number,$1;
    }
    my $Max = maxNumber(@number);
    $latest=$Max+1;
    mkdir(".snapshot.$latest");
    print"Creating snapshot $latest\n";
    my $dir = ".snapshot.$latest";
    foreach my $file(@file_excep_pl){
      copy($file,$dir);
    }

  }
  else{
    mkdir(".snapshot.0");
    print"Creating snapshot 0\n";
    my $dir = ".snapshot.0";
    foreach my $file(@file_excep_pl){
      copy($file,$dir);
    }
  }
}

if($ARGV[0] eq "save"){
  save_file();
}




if($ARGV[0] eq "load"){
  shift @ARGV;
  save_file();
  my $floder = ".snapshot.$ARGV[0]";
  print"Restoring snapshot $ARGV[0]\n";
  opendir $DIR,$floder;
  $pwd=`pwd`;
  chomp($pwd);
  foreach $file(readdir $DIR){
    if($file !~ /^\.\.?$/){
      print"$floder\n";
      print"$file\n";
    copy("$floder/$file","$file");
  }
  }
  closedir $DIR;

}
