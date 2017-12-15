#!/usr/bin/tclsh

variable VALUE_LIST [list 2K 4K 8K 16K 32K 64K 128K 256K 512K 1M 2M 4M 8M 16M 32M 64M 128M]
variable PASS_THROUGHPUT [list 1.2 1.4 1.8 1.16 1.32 1.64 1.128 1.256 1.512 2.1 2.2 2.4 2.8 2.16 2.32 2.64 2.128]
# variable TIMEOUT [list 15 15 15 15 30 30 30 30 30 30 30 30 30 30 30 60 120]

proc get_env {name dst} {
    global env

    upvar 1 ${dst} dst_var

    if {[info exists env(${name})]} {
        puts "Setting '$dst'='$env(${name})' from environment variable '${name}'"
        set dst_var $env(${name})
    } else {
        puts "Environment variable '${name}' not set"
    }
}

proc main {} {
    variable VALUE_LIST
    variable PASS_THROUGHPUT
#    variable TIMEOUT

    set TIMEOUT {}
    get_env "ENV_TIMEOUT" TIMEOUT

    puts "VALUE_LIST: ${VALUE_LIST}"
    puts "PASS_THROUGHPUT: ${PASS_THROUGHPUT}"

    foreach value $VALUE_LIST pass $PASS_THROUGHPUT timeout $TIMEOUT {
        if {${timeout} ne {}} {
            puts "value: ${value} - pass: ${pass} - timeout: ${timeout}"
        } else {
            puts "value: ${value} - pass: ${pass}"
        }
    }
}

main
