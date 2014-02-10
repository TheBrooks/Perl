#! /usr/bin/perl
use v5.10;

$debug = 0;



our @stack = ();

while(<>)
{
	chomp;
	given($_) {
		when ('+') {push @stack, (pop @stack + pop @stack);}
		when ('-') {$right = pop @stack;  push @stack, (pop @stack - right);}
		when ('/') {$right = pop @stack;  push @stack, (pop @stack / right);}
		when ('*') {push @stack, (pop @stack * pop @stack);}
		when ('sqrt') { &sqrt();}
		when ('sum') {&sum();}
		when ('mean') {&mean();}
		when ('squares') {&squares();}
		when ('residuals') {&residuals();}
		when ('stddev') {&stddev();}
		default { push @stack, $_} #push operand
	}

}

sub sqrt
{
	our $stack[-1] = sqrt ($stack[-1]);
}

sub sum {
	# body...
	$stackSum = 0;
	while(@stack)
		$stackSum += pop @stack;
	push @stack, $stackSum;
}

sub mean {
	# body...
	#Replace the stack with the arithmetic mean of all the numbers that were on the stack. This value should 
	#be equal to the sum of all the numbers divided by the size of the stack.
	$stackDiv = scalar @stack;
	&sum();
	$stack[0] /= $stackDiv; 
}

sub squares{
	#Multiply each number on the stack by itself.
	for($operand (our @stack)) { $operand *= $operand; }
}

sub residuals {
	# body...
	#Subtract from each number on the stack the mean of all the numbers on the stack.
	$stackSum = 0;
	for(@stack)
	{
		stackSum += &_
	}
	$stackDiv = scalar @stack;
	$mean = $stackSum/$stackDiv;
	for(@stack){ $_ -= $mean }
}

sub stddev {
	#This value should be equal to the square root of
	# the mean of the squares of the residuals of all the numbers on the stack.
	#sqrt ( mean ( squares (residuals)) )
	&residuals():
	&squares();
	&mean();
	&sqrt();
}
