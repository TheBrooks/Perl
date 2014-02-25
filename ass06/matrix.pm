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
    my $self  = { _matrix => shift };
    return bless  $self, $class;
}

sub add_row {
	@matrix = $self->{_matrix};
	@newRow = split(" ",pop(@_));
	push (@matrix , @newRow);
}

sub myadd {

}

sub mysub {

}

sub mymulti {
	
}

sub string {
	@matrix = $self->{_matrix};
	$string = ""
	for($row (@matrix)){
		$string .= "@$row\n";
	}
	return $string
}

sub print {
	print $self->&string();
}