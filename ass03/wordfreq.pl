#! /usr/bin/perl

use v5.10;

$debug = 0;
open(WORDS, "<", "/usr/share/dict/words");

#compiling dictionary words
@dictWords;
while(<WORDS>){
	chomp;
	push(@dictWords, $_);}

#reading in words to count
while(<>){
	@words_in_line = /[a-z](?:[a-z']*[a-z])?/ig;
	foreach(@words_in_line) { $wordCount{lc $_}++; }}

if($debug) {
	for( @dictWords) { print "$_\n"; }
	foreach my $key (keys %wordCount) {
		$v = $wordCount{$key};
		print "$key : $v\n";}}

#sorting all words
@sortedWords = sort { $wordCount{$b} <=> $wordCount{$a} or $a cmp $b} keys %wordCount; 
printf "Number of distinct words: %i\n",scalar(@sortedWords);
for($i= 0; $i < 10; $i++) { printf "$sortedWords[$i]: %i,\n", $wordCount{$sortedWords[$i]}; }

#deleting common words
for (@dictWords) { delete $wordCount{$_}; }

#sorting uncommon words
@sortedWords = sort {$wordCount{$b} <=> $wordCount{$a} or $a cmp $b} keys (%wordCount); 
printf "Number of distinct words not in dictionary: %i\n",scalar(@sortedWords);
for($i= 0; $i < 10; $i++) {	printf "$sortedWords[$i]: %i\n", $wordCount{$sortedWords[$i]}; }
