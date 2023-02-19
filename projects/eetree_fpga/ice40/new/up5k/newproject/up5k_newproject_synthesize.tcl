if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2022.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "E:/embeded/fpga learning/fpga-basics/projects/eetree_fpga/ice40/new/up5k"
# synthesize IPs
# synthesize VMs
