#! /usr/bin/perl

package matrix;

use v5.10;

#use strict;
#use warnings;

use overload
	'+' => 'myadd',
	'-' => 'mysub',
	'*' => 'mymulti';

sub new {
    my $that = shift;
    my $class = ref($that) || $that;
    my $self  = [];
    if(@_)
	{
	    for my $row ( @_ ) 
	    {
			push (@{$self} , [@{$row}]);	
	    }
	}
	return bless $self, $class;
}

sub copy {
    my $other = shift;
    my $class = ref($other) || $other;
    my $self = [];
    if(@_)
    {
    	for my $row (@{$other}) 
    	{
        	push(@{$self}, [@{$row}]);
    	}
    }
    bless $self, $class;
}

sub add_row {
	my $self = shift; 
	my @newRow = @_;
	push (@{$self} , [@newRow]);
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
		for my $j (0..($width - 1)){
			$returnMatrix->[$i][$j] = $self->[$i][$j] + $rhs->[$i][$j];
		}
	}
	return $returnMatrix;
}


sub mysub {
	my $self = shift;
	my $rhs = shift;
	my $returnMatrix = $self->new();

	#need to get width and height
	my $height = $self->getHeight();
	my $width = $self->getWidth();

	for my $i(0..($height - 1)){
		for my $j (0..($width - 1)){
			$returnMatrix->[$i][$j] = $self->[$i][$j] - $rhs->[$i][$j];
		}
	}
	return $returnMatrix;
}

sub mymulti {
	my $self = shift;
	my $rhs = shift;
	my $returnMatrix = $self->new();

	#need to get width and height
	my $height = $self->getHeight();
	my $width = $self->getWidth();

	for my $i(0..($height - 1)){
		for my $j (0..($width - 1)){
			for my $k (0..$width -1){
				$returnMatrix->[$i][$j] += $self->[$i][$k] * $rhs->[$k][$j];
			}
		}
	}
	return $returnMatrix;
}

sub string {
	my $self = shift;
	my $pstring = "";
	for my $row (@{$self})
	{
		for my $index (@{$row}){
			$pstring .= " $index ";
		}
		$pstring .= "\n";
	}
	return $pstring;
}

sub print {
	my $self = shift;
	print $self->string();

}

return 1;