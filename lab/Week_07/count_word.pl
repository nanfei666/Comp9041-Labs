#!/usr/bin/perl -w
@nunmber=();
$count = 0;
$search_word=$ARGV[0];
$search_word=lc $search_word;
while ($line=<STDIN>) {
  push @nunmber ,(split /[^a-zA-Z]+/, $line);

}
foreach $words (@nunmber){
  $words = lc $words;
  $count++ if $words eq $search_word;
}
print "$ARGV[0] occureed $count times";
