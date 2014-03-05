#! /usr/bin/perl
use v5.10;
use matrix;

$debug = 0;

print "Content-type:text/html\r\n\r\n";
print "<html>";
print "<head>";
print "<title>Sequence Database -  ass07</title>";
print "</head>";
print "<body>";
#adding
print <<ENTER_SEQ_NAME;

<h2>Enter the Name of a sequence: <br><\h2>
<input type="text" name="name_box_add"><br>
ENTER_SEQ_NAME

print <<ENTER_SEQ;

<h2Enter your sequence here:  <br><\h2>
<input type="text" name="seq_box_add"><br>
ENTER_SEQ

print << ADD_SEQ_BUTTON;
<input type="submit" value="Add Sequence"><br>
ADD_SEQ_BUTTON


#Searching
print <<SEARCH_SEQ_NAME;

<h2>Enter the sequence to search (leave the fields you want blank empty)<br>
Name of sequence: <br><\h2>
<input type="text" name="name_box_search"><br>
ENTER_SEQ_NAME

print <<SEARCH_SEQ;

<h2>Sequence characters: <br><\h2>
<input type="text" name="seq_box_search"><br>
SEARCH_SEQ

print<<EMAIL_SEARCH;
<h2>Enter your email address to send you the results: <br><\h2>
<input type="text" name="email_box_search"><br>
EMAIL_SEARCH

print << SEARCH_SEQ_BUTTON;
<input type="submit" value="Search Sequence"><br>
SEARCH_SEQ_BUTTON

#reser

print<<RESET_DBASE;
<h2>Press this button if you want to reset the database<br><\h2>
<input type="submit" value="reset database"><br>
RESET_DBASE

print "</body>";
print "</html>";

1;
