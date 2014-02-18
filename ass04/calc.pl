#! /usr/bin/perl
use v5.10;
my @stack;

sub sqrt{
    
	push @stack, sqrt (pop @stack);
}

sub sum {
    $stackSum = &calcSum();
	undef @stack;
	push @stack, $stackSum;
}

sub mean {
	$stackMean = &calcMean();
	undef @stack;
	push @stack, $stackMean; 
}

sub squares{
	for(@stack) { $_ *= $_; }
}

sub residuals {
	$mean = &calcMean();
	for(@stack){ $_ -= $mean }
}

sub stddev {
	&residuals();
	&squares();
	&mean();
	&sqrt();
}

sub calcSum{
	$stackSum = 0;
	for(@stack) { $stackSum += $_ }
	return $stackSum;
}

sub calcMean {
	return &calcSum() / scalar @stack;
}

while(<>)
{
	chomp;
	given($_) {
		when ('+') {$right = pop @stack;
                    $left = pop @stack ;
                    push @stack, ($left + $right) ;
                    print ("Stack: @stack\n");}
		when ('-') {$right = pop @stack;
                    $left = pop @stack ;
                    push @stack, ($left - $right) ;
                    print ("Stack: @stack\n");}
		when ('/') {$right = pop (@stack);
                    $left =  pop (@stack);
                    push @stack, ($left / $right) ;
                    print ("Stack: @stack\n");}
		when ('*') {$right = pop @stack;
                    $left = pop @stack ;
                    push @stack, ($left * $right) ;
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
