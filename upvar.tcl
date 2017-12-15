#!/usr/bin/tclsh

variable PROTOCOL_OPTION_LIST [list tcp_w tcp_n tcp_t udp_b udp_n udp_t]

proc split_protocol_option { protocol_option {out_proto ""} {out_opt ""} } {
    # Link return variables
    if {${out_proto} ne ""} {
        upvar 1 ${out_proto} proto
        puts "link - out_proto"
    }
    if {${out_opt} ne ""} {
        upvar 1 ${out_opt} opt
        puts "link - out_opt"
    }

    lassign [split $protocol_option "_"] protocol option

    # proto variable
    if {[string compare -nocase ${protocol} "tcp"] == 0} {
        set proto ""
    } elseif {[string compare -nocase ${protocol} "udp"] == 0} {
        set proto "-u"
    } else {
        # Should not come here, or PROTOCOL_OPTION_LIST has wrong value
        set proto ""
        loge "Invalid protocol value - ${protocol_option}"
        Lava::result_for_test "PROTOCOL_OPTION_LIST_error_${protocol_option}" "fail"
        # return to run_server / run_client level
        return -level 3 -1
    }

    # opt variable
    set opt "-${option}"
}

proc main {} {
    variable PROTOCOL_OPTION_LIST

    foreach options $PROTOCOL_OPTION_LIST {
        set proto "null"
        set opt "null"

#        split_protocol_option $options proto opt
#        split_protocol_option $options proto
        split_protocol_option $options

        puts "proto: ${proto}, opt: ${opt}"
    }

}

main
