#! /usr/bin/perl

use v5.10;

$debug = 0;

open(WORDS, "<", "/usr/share/dict/words");

@dictWords;
while(<WORDS>)
{
	chomp;
	push(@dictWords, map { lc } $_);
}

if ($debug > 1)
{
	for( @dictWords)
	{
		print "$_\n";
	}
} 

%wordCount;

while(<>)
{
	@words_in_line = /[a-z](?:[a-z']*[a-z])?/ig;

	foreach(@words_in_line)
	{
		$wordCount{lc $_}++;
	}
	
}

if($debug)
{
	foreach my $key (keys %wordCount) 
	{
		$v = $wordCount{$key};
		print "$key : $v\n";
	} 
}

print "\n\nsorting\n\n\n" if ($debug);
@sortedWords = sort { $wordCount{$b} <=> $wordCount{$a} or $a cmp $b} keys %wordCount; 

for( $i= 0; $i < 10; $i++)
{
	printf "$sortedWords[$i]: %i,\n", $wordCount{$sortedWords[$i]};
}


for (@dictWords)
{
	delete $wordCount{$_};
}
print "\n";
print "\n\n\n\nuncommon \n\n\n\n\n" if ($debug);
@sortedWords = sort {$wordCount{$b} <=> $wordCount{$a} or $a cmp $b} keys (%wordCount); 
for( $i= 0; $i < 10; $i++)
{	
	printf "$sortedWords[$i]: %i,\n", $wordCount{$sortedWords[$i]}; 
}
