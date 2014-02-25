#! /usr/bin/perl
use v5.10;

$debug = 0;

while(<>){
	@emails_in_line = /(?<!\S)[aA-zZ0-9-_]+(?:\.[aA-zZ0-9-_]+)?@[aA-zZ0-9-_]+(?:\.[aA-zZ0-9-_]+)?\b/gx;
	foreach(@emails_in_line) 
	{ 
		$emailCount{$_}++; 
	}
}

@sortedEmails = sort { $emailCount{$b} <=> $emailCount{$a} or $a cmp $b} keys %emailCount; 
printf "Number of distinct words: %i\n",scalar(@sortedEmails);
for($i= 0; $i < scalar(@sortedEmails); $i++) { printf "$sortedEmails[$i]: (%i)\n", $emailCount{$sortedEmails[$i]}; }
