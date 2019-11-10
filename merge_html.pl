#!/usr/bin/perl -wT
# Matija Nalis GPLv3+, reads HTML from STDIN, and outputs merged HTML+JS+CSS to STDOUT
#
use strict;
use autodie qw(:all);

sub insert_file($$) {
	my ($tag, $filename) = @_;

	print "<$tag>\n";
	open my $include, '<', $filename;
	while (<$include>) {
		print;
	}
	return "</$tag>\n";
}

my $VERSION=localtime;

while (<STDIN>) {
	s{<link href="(.*?)" rel="stylesheet">}{insert_file('style', $1)}ge;	# insert CSS
	s{<script src="(.*?)"></script>}{insert_file('script', $1)}ge;		# insert JS
	s{_DEVEL_VER_}{$VERSION}g;						# update version
	print;
}
