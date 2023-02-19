if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2022.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "E:/embeded/fpga learning/fpga-basics/projects/eetree_fpga/ice40/new/counter"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- counter_impl1.vm counter_impl1.ldc
run_engine_newmsg synthesis -f "counter_impl1_lattice.synproj"
run_postsyn [list -a iCE40UP -p iCE40UP3K -t UWG30 -sp High-Performance_1.2V -oc Industrial -top -w -o counter_impl1_syn.udb counter_impl1.vm] "E:/embeded/fpga learning/fpga-basics/projects/eetree_fpga/ice40/new/counter/impl1/counter_impl1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
