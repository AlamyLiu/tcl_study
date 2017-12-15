#!/usr/bin/tclsh

set w_range {2K 4K 8K 16K 32K 64K}
set pass_throughput {3.8 4.5 2.30 5.2 1.62 2.2}

set join_range [join $w_range ","]

puts "join_range=$join_range"

set split_range [split $join_range ","]

puts "split_range=$split_range"

set wcount [llength $split_range]

if { [llength $w_range] != [llength $pass_throughput] } {
    puts "Range num != Pass num"
}

puts "word count = $wcount"
