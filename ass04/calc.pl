#! /usr/bin/perl
use v5.10;
our @stack;

sub sqrt{
    
	push @stack, sqrt (pop our @stack);
}

sub sum {
    $stackSum = &calcSum();
	undef our @stack;
	push our @stack, $stackSum;
}

sub mean {
	$stackMean = &calcMean();
	undef our @stack;
	push our @stack, $stackMean; 
}

sub squares{
	for(our @stack) { $_ *= $_; }
}

sub residuals {
	$mean = &calcMean();
	for(our @stack){ $_ -= $mean }
}

sub stddev {
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
}
