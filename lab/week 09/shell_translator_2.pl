
#!/usr/bin/perl -w

while ($line = <>) {

	if ($. == 1 && $line =~ /^#!/) {
		print "#!/usr/bin/perl -w\n";
		next;
	}

	# remove trailing white space
	$line =~ s/\s*$//;

	# remove and save leading white space
	$line =~ s/^(\s*)//;
	my ($indent) = $1;

	# remove and save any comment
	$line =~ s/(\s*#.*)//;
	my ($comment) = $1;

	my $perl = "";
	if ($line =~ /^(do|then)$/) {
		$perl = "";
	} elsif ($line =~ /^(done|fi)$/) {
		$perl = "}";
	} elsif ($line =~ /^else$/) {
		$perl = "} else {";
	} elsif ($line =~ /^echo\s+(.*)$/) {
		$perl = "print \"$1\\n\";";
	} elsif ($line =~ /^(if|while)\s+\(\((.*)\)\)$/) {
		my $keyword = $1;
		my $expression = $2;
		# add $ in front of any variable that don't already have a $
		$expression =~ s/(^|[^\$])([a-zA-Z]\w*)/$1\$$2/g;
		$perl = "$keyword ($expression) {";
	} elsif ($line =~ /(.*?)=\$\(\((.*)\)\)/) {
		my $lhs = $1;
		my $expression = $2;
		$expression =~ s/(^|[^\$])([a-zA-Z]\w*)/$1\$$2/g;
		$perl = "\$$lhs = $expression;";
	} elsif ($line =~ /(.*?)=(.*)/) {
		my $lhs = $1;
		my $rhs = $2;
		$rhs =~ s/(^|[^\$])([a-zA-Z]\w*)/$1\$$2/g;
		$perl = "\$$1 = $2;";
	}

	print "$indent$perl$comment\n" if "$perl$comment";
}
