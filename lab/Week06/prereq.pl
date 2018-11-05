#!/usr/bin/perl



@ARGV>=1 or die "Usage: Need Specify Course Code";
$course = $ARGV[0];

$url = "http://legacy.handbook.unsw.edu.au/postgraduate/courses/2018/";
$under_url = "http://legacy.handbook.unsw.edu.au/undergraduate/courses/2018/";

$course=~ /^[A-Z]{4}[0-9]{4}$/ or die "$course is not a valid course code \n";

$Course_Url = "$url"."$course".".html";
$under_Course_Url="$under_url"."$course".".html";

open F,"-|","wget -q -O- $Course_Url $under_Course_Url" or die "Can Not Open $Course_Url";

while ($line = <F>){
  chomp $line;
  if($line=~ /Prerequisite(s)?:/){
    if($line=~ /([A-Z]{4}[0-9]{4})/){
      $line =~ s/<[^>]*>/ /g;
      $line =~ s/EXCLU.*/ /i;
       @courses = $line =~ /([A-Z]{4}\d{4})/g;
       #print "@courses \n";
       push @prereqs, @courses;
      #print "@prereqs \n";
    }
  }
}
close F;
foreach $prerequist (sort @prereqs){
  print"$prerequist \n"
}
