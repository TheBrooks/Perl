#! /usr/bin/perl

package matrix;

use v5.10;

$debug = 0;

use strict;
use warnings;

 use overload
	'+' => \&myadd,
	'-' => \&mysub;
	'*' => \&mymulti

sub new {
    my $class = shift;
    my $self  = [];
    return bless  $self, $class;
}

sub add_row {
	my $self = shift;
	@matrix = $self;
	@newRow = split(" ",pop(@_));
	push (@matrix , @newRow);
}

sub myadd {
	my $self = shift;
}

sub mysub {
	my $self = shift;
}

sub mymulti {
	my $self = shift;
}

sub string {
	my $self = shift;
	$string = ""
	for($row (@$self)){
		$string .= "@$row\n";
	}
	return $string
}

sub print {
	my $self = shift;
	print $self->&string();
}