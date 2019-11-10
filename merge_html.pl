#!/usr/bin/perl -wT
# Matija Nalis GPLv3+, reads HTML from STDIN, and outputs merged HTML+JS+CSS to STDOUT
#
use strict;
use autodie qw(:all);

sub insert_file($$) {
	my ($tag, $filename) = @_;
	my $ret = '';

	$ret .= "<$tag>\n" if $tag;
	open my $include, '<', $filename;
	while (<$include>) {
		$ret .= $_;
	}
	$ret .= "</$tag>\n" if $tag;
	return $ret;
}

my $VERSION=localtime;

while (<STDIN>) {
	s{<link href="(.*?)" rel="stylesheet">}{insert_file('style', $1)}ge;	# insert CSS
	s{<script src="(.*?)"></script>}{insert_file('script', $1)}ge;		# insert JS
	s{<img src="(.*?)" alt=".*?">}{insert_file('', $1)}ge;			# insert SVG
	s{_DEVEL_VER_}{$VERSION}g;						# update version
	print;
}
