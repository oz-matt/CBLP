set_global_assignment -entity "qtestpd" -library "lib_qtestpd" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "qtestpd" -library "lib_qtestpd" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "qtestpd" -library "lib_qtestpd" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_qtestpd" -name SPD_FILE [file join $::quartus(sip_path) "../qtestpd.spd"]
set_global_assignment -library "lib_qtestpd" -name MISC_FILE [file join $::quartus(sip_path) "../../qtestpd.qsys"]

set_global_assignment -library "lib_qtestpd" -name MISC_FILE [file join $::quartus(sip_path) "qtestpd.v"]
set_global_assignment -library "lib_qtestpd" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_qtestpd" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_qtestpd" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
set_global_assignment -library "lib_qtestpd" -name MISC_FILE [file join $::quartus(sip_path) "submodules/qtestpd_onchip_memory2_0.v"]
