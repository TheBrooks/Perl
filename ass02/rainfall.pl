#! /usr/bin/perl

use v5.10;

$totalRainfall = 0;
$positiveRainfallDays = 0;
$traceRainfallDays = 0;
$noRainfallDays = 0;
$missingRainfallDataDays = 0;

while(<STDIN>)
{
	chomp;
	
	given($_){
		when('T') { $traceRainfallDays += 1;}
		when('0') {$noRainfallDays += 1;}
		when('999.99'){$missingRainfallDataDays += 1;}
		default{$positiveRainfallDays += 1; $totalRainfall += $_;}
	}
}


if ($totalRainfall != 1){ print "Total Rainfall: $totalRainfall inches\n"; }
else{ print "Total Rainfall: $totalRainfall inch\n"; }

if ($positiveRainfallDays != 1) { print "$positiveRainfallDays days of rain\n";}
else { print "$positiveRainfallDays day of rain\n";}

if ($traceRainfallDays != 1) {print "$traceRainfallDays days with trace precipitation\n"; }
else {print  "$traceRainfallDays day with trace precipitation\n"; }

if ($noRainfallDays != 1) {print "$noRainfallDays days with no rain\n"; }
else {print "$noRainfallDays day with no rain\n";}

if ($missingRainfallDataDays != 1) { print "$missingRainfallDataDays days with missing data\n"; }
else {print "$missingRainfallDataDays day with missing data\n"; }


