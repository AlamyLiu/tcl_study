#!/usr/bin/tclsh


proc client {opts} {
#    variable opt_w

#    set opt_w [array get opts{"w"}]
#    puts "${w} : $opts(w)"

#    puts $opts
#    puts [lindex $opts 3]
    set opt_t_list [lassign $opts opt_w_min opt_w_max opt_b_min opt_b_max opt_n_min opt_n_max]

    puts "W: $opt_w_min .. $opt_w_max"
    puts "B: $opt_b_min .. $opt_b_max"
    puts "N: $opt_n_min .. $opt_n_max"
    puts $opt_t_list

#        || [[string compare $opt_w_max {}] == 0]
#        || [[string compare $opt_b_min {}] == 0]
#        || [[string compare $opt_b_max {}] == 0]
#        || [[string compare $opt_n_min {}] == 0]
#        || [[string compare $opt_n_max {}] == 0] } {

#    if {   (${opt_w_min} == "") || (${opt_w_max} == "")
#        || (${opt_b_min} == "") || (${opt_b_max} == ""})
#        || (${opt_n_min} == "") || (${opt_n_max} == "") } {
#        puts "Missing parameter"
#    }

#    if {   ($opt_w_min == "") || ($opt_w_max == "")
#        || ($opt_b_min == "") || ($opt_b_max == ""})
#        || ($opt_n_min == "") || ($opt_n_max == "") } {
#        puts "Missing parameter"
#    }

#    if {   ($opt_w_min eq {}) || ($opt_w_max eq {})
#        || ($opt_b_min eq {}) || ($opt_b_max eq {})
#        || ($opt_n_min eq {}) || ($opt_n_max eq {}) } {
#        puts "Missing parameter"
#    }

#    if {   {$opt_w_min eq {}} || {$opt_w_max eq {}}
#        || {$opt_b_min eq {}} || {$opt_b_max eq {}}
#        || {$opt_n_min eq {}} || {$opt_n_max eq {}} } {
#        puts "Missing parameter"
#    }

    puts "Good parameters"
}

proc main {} {
#    variable opts
    set opt_w_min   2K  ;# -w (--window)     TCP windows size
    set opt_w_max  64K  ;#      2K 4K 8K 16K 32K 64K
    set opt_b_min  16K  ;# -b (--bandwidth)  UDP bandwidth
    set opt_b_max   1G  ;#      16K 32K 64K ... 512K 1M 2M ... 512M 1G
    set opt_n_min   2K  ;# -n (--num)        number of bytes to transmit
    set opt_n_max 128M  ;#      2K 4K ... 512K 1M 2M ... 32M 64M 128M
    set opt_t_list {2 4 8 15 3 60 120 240}  ;# seconds

#    set opt_w_min "2K"
#    set opt_w_max "64K"
#    set opt_b_min "16K"
#    set opt_b_max "1G"
#    set opt_n_min "2K"
#    set opt_n_max "128M"
#    set opt_t_list "2 4 8 15 3 60 120 240"

#    set opts(w) {${opt_w_min} opt_w_max}
    set array_opts(w) ${opt_w_max}
    puts $opt_w_min
    array set array_opts {
        b   "$opt_b_min $opt_b_max"
        n   "$opt_n_min $opt_n_max"
        t   $opt_t_list
    }

    # original design structure
    #   opts(w) == {opt_w_min opt_w_max}
    #   opts(t) == {opt_t_list}
    # No structure, and could not get it to work using _array_,
    # use dictionary instead

#    set dict_opts [dict create $opt_w_min $opt_w_max $opt_t_list]
#    set opts [dict create $opt_w_min $opt_w_max $opt_b_min $opt_b_max $opt_n_min $opt_n_max $opt_t_list]

    set opts [list $opt_w_min $opt_w_max $opt_b_min $opt_b_max $opt_n_min $opt_n_max $opt_t_list]

#    puts $dict_opts
    puts $array_opts(w)
    puts ----------
    client $opts

}

main
