set_global_assignment -entity "qtest" -library "lib_qtest" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "qtest" -library "lib_qtest" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "qtest" -library "lib_qtest" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_qtest" -name SPD_FILE [file join $::quartus(sip_path) "../qtest.spd"]
set_global_assignment -library "lib_qtest" -name MISC_FILE [file join $::quartus(sip_path) "../../qtest.qsys"]

set_global_assignment -library "lib_qtest" -name MISC_FILE [file join $::quartus(sip_path) "qtest.v"]
set_global_assignment -library "lib_qtest" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_qtest" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_qtest" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
set_global_assignment -library "lib_qtest" -name MISC_FILE [file join $::quartus(sip_path) "submodules/qtest_onchip_memory2_0.hex"]
set_global_assignment -library "lib_qtest" -name MISC_FILE [file join $::quartus(sip_path) "submodules/qtest_onchip_memory2_0.v"]
