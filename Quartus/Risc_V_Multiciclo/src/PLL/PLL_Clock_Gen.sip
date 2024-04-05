set_global_assignment -entity "PLL_Clock_Gen" -library "lib_PLL_Clock_Gen" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_Clock_Gen" -library "lib_PLL_Clock_Gen" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "PLL_Clock_Gen" -library "lib_PLL_Clock_Gen" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_Clock_Gen" -name SPD_FILE [file join $::quartus(sip_path) "PLL_Clock_Gen.spd"]

set_global_assignment -library "lib_PLL_Clock_Gen" -name MISC_FILE [file join $::quartus(sip_path) "PLL_Clock_Gen_sim/PLL_Clock_Gen.vo"]
