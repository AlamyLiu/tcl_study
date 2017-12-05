#!/usr/bin/tclsh

set OPT_MIN 128k
set OPT_MAX 8m
set in_range false

set size_unit_list {B K M G}
set size_value_list {1 2 4 8 16 32 64 128 256 512}

foreach size_unit $size_unit_list {
	foreach size_value $size_value_list {
		set opt $size_value$size_unit
		if { ![string is true $in_range] } {
			puts "checking $opt ..."
			if {[string compare -nocase $opt $OPT_MIN] == 0} {
				set in_range true
			}
		}
		if { $in_range } {
			puts "$opt"

			if {[string compare -nocase $opt $OPT_MAX] == 0} {
				set in_range false
			}
		}
	}
}

