#!/usr/bin/perl -w
@nunmber=();
$count = 0;
while ($line=<STDIN>) {

  push @nunmber ,(split /[^a-zA-Z]+/, $line);

}
foreach $words (@nunmber){
$count++ if $words ne '';
}
print "$count words\n";
