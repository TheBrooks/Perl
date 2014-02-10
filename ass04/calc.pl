#! /usr/bin/perl
use v5.10;

our @stack;

sub sqrt{
    
	push @stack, sqrt (pop our @stack);
}

sub sum {
	# body...
    $stackSum = &calcSum();
	undef our @stack;
	push our @stack, $stackSum;
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
	&residuals();
	&squares();
	&mean();
	&sqrt();
}

sub calcSum{
	$stackSum = 0;
	for(our @stack) { $stackSum += $_ }
	return $stackSum;
}

sub calcMean {
	return &calcSum() / scalar our @stack;
}

while(<>)
{
	chomp;
    
	#do some reading and printing still
    print ("pre Stack: @stack\n");
    
	given($_) {
		when ('+') {$right = pop our @stack;
                    $left = pop our @stack ;
                    push our @stack, ($left + $right) ;
                    print ("Stack: @stack\n");}
		when ('-') {$right = pop our @stack;
                    $left = pop our @stack ;
                    push our @stack, ($left - $right) ;
                    print ("Stack: @stack\n");}
		when ('/') {$right = pop (our @stack);
                    $left =  pop (our @stack);
                    push our @stack, ($left / $right) ;
                    print ("Stack: @stack\n");}
		when ('*') {$right = pop our @stack;
                    $left = pop our @stack ;
                    push our @stack, ($left * $right) ;
                    print ("Stack: @stack\n");}
		when ('sqrt') { &sqrt(); print ("Stack: @stack\n");}
		when ('sum') {&sum(); print ("Stack: @stack\n");}
		when ('mean') {&mean(); print ("Stack: @stack\n");}
		when ('squares') {&squares(); print ("Stack: @stack\n");}
		when ('residuals') {&residuals(); print ("Stack: @stack\n");}
		when ('stddev') {&stddev();  print ("Stack: @stack\n");}
		default { push our @stack, $_} #push operand
	}
    print ("post Stack: @stack\n");
}
