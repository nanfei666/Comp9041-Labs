#!/usr/bin/perl -w

$number_of_time = $ARGV[0];
while ($line=<STDIN>){
  if(exists($command_line{$line})){
    $command_line{$line}++;
    #print"$command_line{$line}\n";
    if($command_line{$line}==$number_of_time){
      print"Snap: $line";
      exit(0);
    }
  }
  else{
    $command_line{$line}=1;
    #print"$command_line{$line}\n";

  }
}
