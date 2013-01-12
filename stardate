#!/usr/bin/perl

my $trek_year;
my $sd;

($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = 
    gmtime(time);

$trek_year = ($year - 70) * 1000;

$sd = ((($yday)*1000/365.25 + $trek_year));

printf "%.1f\n", $sd;

