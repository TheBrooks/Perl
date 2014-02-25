#! /usr/bin/perl

package matrix;

use v5.10;

$debug = 0;

use strict;
use warnings;

 use overload
	'+' => 'myadd',
	'-' => 'mysub',
	'*' => 'mymulti';

sub new {
    my $class = shift;
    my $self  = [];
    for($row (@_))
    	$self->&add_row(@$row);
    return bless  $self, $class;
}

sub add_row {
	my $self = shift;
	@newRow = split(" ",shift);
	push (@{$self} , @newRow);
}

sub getHeight {
	my $self = shift;
	return scalar(@{$self});
}

sub getWidth {
	my $self = shift;
	return scalar(@{$self->[0]})
}

sub myadd {
	my $self = shift;
	my $rhs = shift;
	my $returnMatrix = $self->new();

	#need to get width and height
	my $height = $self->getHeight();
	my $width = $self->getWidth();

	for my $i(0..($height - 1)){
		$newRow = "";
		for my $j (0..($width - 1)){
			$newIndex = $self->[i][j] + $rhs->[i][j]
			$newRow .= " $newIndex ";
		}
		$returnMatrix -> add_row($newRow)
	}
	return $returnMatrix;
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