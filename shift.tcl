#!/usr/bin/tclsh

proc shift {list} {
    upvar 1 $list LIST

    set ret [lindex $LIST 0]
    set LIST [lreplace $LIST 0 0]
    return $ret
}

proc loop {} {
    set value_list [list 2K 4K 8K 16K 32K 64K]
    set throughput_list [list 7.5 7.5 8.0 8.0 8.0 8.5]

    while {([llength $value_list] > 0) && ([llength $throughput_list] > 0)} {
        # take out the first item from the list
        set value [shift value_list]
        set throughput [shift throughput_list]

        puts "${value} - ${throughput}"
    }

}

proc main {} {
    loop
}

main
