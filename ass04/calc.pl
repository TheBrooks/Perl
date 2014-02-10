#! /usr/bin/perl
use v5.10;

$debug = 0;



our @stack = ();

while(<>)
{
	chomp;

	#do some reading and printing still

	given($_) {
		when ('+') {push our @stack, (pop our @stack + pop our @stack); print ("@stack");}
		when ('-') {$right = pop our @stack;  push our @stack, (pop our @stack - $right); print ("@stack");}
		when ('/') {$right = pop our @stack;  push our @stack, (pop our @stack / $right); print ("@stack");}
		when ('*') {push our @stack, (pop our @stack * pop our @stack); print ("@stack");}
		when ('sqrt') { &sqrt(); print ("@stack");}
		when ('sum') {&sum(); print ("@stack");}
		when ('mean') {&mean(); print ("@stack");}
		when ('squares') {&squares(); print ("@stack");}
		when ('residuals') {&residuals(); print ("@stack");}
		when ('stddev') {&stddev();  print ("@stack");}
		default { push our @stack, $_} #push operand
	}

}

sub sqrt
{
	our $stack[-1] = sqrt ($stack[-1]);
}

sub sum {
	# body...
	undef our @stack;
	push our @stack, &calcSum();
}

sub mean {
	# body...
	#Replace the stack with the arithmetic mean of all the numbers that were on the stack. This value should 
	#be equal to the sum of all the numbers divided by the size of the stack.
	$stackMean = &calcMean();
	undef our @stack;
	push our @stack, $stackMean; 
}

sub squares{
	#Multiply each number on the stack by itself.
	for(our @stack) { $_ *= $_; }
}

sub residuals {
	# body...
	#Subtract from each number on the stack the mean of all the numbers on the stack.
	$mean = &calcMean();
	for(our @stack){ $_ -= $mean }
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

sub calcSum{
	$stackSum = 0;
	for(our @stack) { $stackSum += &_ }
	return $stackSum;
}

sub calcMean {
	return &calcSum / scalar our @stack;
}
