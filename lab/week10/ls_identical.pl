#!/usr/bin/perl -w
$path1 = $ARGV[0];
$path_2 = $ARGV[1];
opendir (my $f,$path1);
foreach my $file(readdir $f){
  if($file !~ /^\.\.?$/){
  if(-e "$path_2/$file"){
    open my $F,"<","$path1/$file";
    open my $F_2 ,"<","$path_2/$file";
    @line_1=<$F>;
    @line_2=<$F_2>;
    my $flage=0;

    close $F;
    close $F_2;
    if (@line_1 == @line_2) {
      for(my $i=0;$i<@line_1;$i++){
        if($line_1[$i] ne $line_2[$i]){
          $flage=1
    }
    }

    }
else{
  $flage=1;
}
if($flage != 1){
  push @name,$file
}

  }
}
}
@sorted_name = sort{$a cmp $b} @name;
foreach $name(@sorted_name){
  print"$name\n";
}
