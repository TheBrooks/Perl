#! /usr/bin/perl
use v5.10;
use matrix;

$debug = 0;

$matrix1 =  matrix->new();
$matrix2 = matrix->new();
$firstMatrixRead = 1;
while(<>){
	chomp;
	@matrixRow = split;
	if($firstMatrixRead){
		if(@matrixRow)
		{
			$matrix1->add_row(@matrixRow)
		}
		else
		{
			$firstMatrixRead = 0;
		}
	}
	else
	{
		if(@matrixRow)
		{
			$matrix2->add_row(@matrixRow)
		}
		else
		{
			$firstMatrixRead = 1;
			$returnMatrix = ($matrix1 - $matrix2);

			$returnMatrix ->print();
			print "\n";
			$matrix1 = matrix->new();
			$matrix2 = matrix->new();
		}
	}
}

