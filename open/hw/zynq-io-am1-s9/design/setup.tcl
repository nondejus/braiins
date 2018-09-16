####################################################################################################
# Procedure for printing state of script run with timestamp
proc timestamp {arg} {
	puts ""
	puts "********************************************************************************"
	puts "[clock format [clock seconds] -format %H:%M:%S:] $arg"
	puts "********************************************************************************"
}

####################################################################################################
# CHECK INPUT ARGUMENTS
####################################################################################################
# check number of arguments
if {$argc == 1} {
	set board [lindex $argv 0]
} else {
	puts "Wrong number of TCL arguments! Expected 1 argument, get $argc"
	puts "List of arguments: $argv"
	exit 1
}

# check name of the board
if {$board != "S9"} {
	puts "Unknown board: $board"
	puts "Only supported board is S9!"
	exit 1
}

puts "Board name: $board"

####################################################################################################
# Preset global variables and attributes
####################################################################################################
# Design name ("system" recommended)
set design "system"

# Device name
set partname "xc7z010clg400-1"

# Define number of parallel jobs
set jobs 8

# Project directory
set projdir "./build_$board"

# Paths to all IP blocks to use in Vivado "system.bd"
set ip_repos [ list \
	"$projdir" \
]

# Set source files
set hdl_files [ \
]

# Set synthesis and implementation constraints files
set constraints_files [list \
	"src/constrs/pin_assignment.tcl" \
]

####################################################################################################
# Run synthesis, P&R and bitstream generation
####################################################################################################
source "./generate_build_id.tcl"
source "./system_init.tcl"
source "./system_build.tcl"

####################################################################################################
# Exit Vivado
####################################################################################################
exit
