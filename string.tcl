#!/usr/bin/tclsh


proc string1 {} {
    puts "----- string1 -----"
    set params "cmd=iterate protocol_option=tcp_n opt_value=8K"
    puts "params: ${params}"

    set params "${params} timeout=45"
    puts "params: ${params}"
}

proc string_join {} {
    puts "----- join -----"
    set params "cmd=iterate protocol_option=tcp_n opt_value=8K"
    set timeout "timeout=45"

    set params [join ${params} ${timeout}]
    puts "params: ${params}"
}

proc string_append {} {
    puts "----- append -----"
    set params "cmd=iterate protocol_option=tcp_n opt_value=8K"
    set timeout "timeout=45"

    append params " " ${timeout}
    puts "params: ${params}"

    append params " ${timeout}"
    puts "params: ${params}"
}

proc string_lappend {} {
    puts "----- lappend -----"
    set params "cmd=iterate protocol_option=tcp_n opt_value=8K"
    set timeout 50

    lappend params "timeout=${timeout}"
    puts "params: ${params}"
}

proc main {} {
    string1
    string_join
    string_append
    string_lappend
}

main
