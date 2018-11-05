
#!/usr/bin/perl -w
$search_word=$ARGV[0];
$search_word = lc $search_word;
foreach $file(glob "lyrics/*.txt"){
  $count_equal=0;
  $count_all=0;
  @all_words=();
  my $artis = $file;
  $artis =~ s/.*\///;
  $artis =~ s/\.txt//;
  $artis =~ s/_/ /g;
  open my $f,'<',$file or die "can not open $file: $!";

  while (<$f>) {
  tr/A-Z/a-z/;
  foreach (/[a-z]+/g){
    $frequency{$artis}{$_}++;
    $n_words{$artis}++;
  }
  }

close $f;

#printf "log((%d+1)/%6d) = %8.4f %s\n", $count_equal,$count_all,log(($count_equal+1)/$count_all),$artis;
}
@artists = keys %frequency;
foreach $file (@ARGV){
  open my $f,'<',$file or die "can't open $file";
  my %log_probability;
  while(<$f>){
    tr/A-Z/a-z/;
    foreach $word (/[a-z]+/g){
      foreach $artis (@artists){
        $log_probability{$artis}+= log((($frequency{$artis}{$word}||0)+1)/$n_words{$artis});
      }
    }
  }
  close $f;
  @sorted_artists = sort {$log_probability{$b} <=> $log_probability{$a}} @artists;
  printf "%s most resembles the work of %s (log-probability $log_probability=%.1f)\n",$file,$sorted_artists[0],$log_probability{$sorted_artists[0]};
}
