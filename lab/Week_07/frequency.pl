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

  while ($line = <$f>) {
    push @all_words,(split /[^a-zA-Z]+/,$line);
  }
close $f;

foreach $words (@all_words){
  $words = lc $words;
  $count_all++ if $words ne '';
  $count_equal++ if $words eq $search_word;
}

printf "%4d/%6d = %.9f %s\n", $count_equal, $count_all, $count_equal/$count_all, $artis;
}
