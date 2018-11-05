#!/usr/bin/perl -w

$bash_file = $ARGV[0];
open my $f,"<",$bash_file;
while($line=<$f>){
  if($line=~ /bin/){
  $line="#!/usr/bin/perl -w";
  #push @perl_file,$line;
  print"$line\n";
}

elsif($line=~ /(^[a-z]*)=([0-9]*)$/){
  $paramenter="\$$1=$2;";
  #print"$paramenter\n";
  #push @perl_file,$paramenter;
  print"$paramenter\n";
}
#if($line=~ /^(if|while)\s+\(\((.)\)\)$/){
elsif($line=~ /^(while|if)\s+\(\((.*)\)\)$/){
  my $functin_title=$1;
  my $condition=$2;
  #print"jin le\n";

  #$condition=~ s/([a-z]+)([<=>]+)([a-z]$)/\$$1$2\$$3/g;
  $condition =~ s/(^|[^\$])([a-zA-Z]\w*)/$1\$$2/g;
  $expression = "$functin_title($condition) {";
  #push @perl_file, $expression;
  print"$expression\n";
}
elsif($line=~ /^(do|then)$/){
  $line="";
  #push @perl_file,$line;
  print"$line\n";
}
elsif($line=~ /^(done|fi)$/){
  $line="}";
  print"$line\n";
  #push @perl_file,$line;
}
elsif ($line =~ /\s*?echo\s+(.*)$/) {
  #print"jin le\n";
   $line = "print \"$1\\n\";";
   print"$line\n";
 }
 elsif ($line =~ /^else$/) {
		$perl = "} else {";
  print"$perl\n"}
# elsif($line=~/^([a-b])=\$\(\((.*)\)\)$/){
#   my $paramenter=$1;
#   my $paramenter_2=$2;
#   $line="\$$1="
# }
elsif ($line =~ /(.*?)=\$\(\((.*)\)\)$/) {
   my $lhs = $1;
   my $expression = $2;
   $space=$lhs;
   $space=~/(\s+).*/;
   $space=$1;
   #print"$1\n";

   $lhs=~ s/\s+//g;
    #print"$lhs\n";
   #
   # print"$1\n";

   $expression =~ s/(^|[^\$])([a-zA-Z]\w*)/$1\$$2/g;
   $line = "$space\$$lhs = $expression;";
   #push @perl_file, $line;
   print"$line\n";

 }


else{
  #push @perl_file, $line;
  print"$line\n";
}
}
